package com.josiah.sketch.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.josiah.sketch.models.Idea;
import com.josiah.sketch.models.LoginUser;
import com.josiah.sketch.models.Song;
import com.josiah.sketch.models.User;
import com.josiah.sketch.services.IdeaService;
import com.josiah.sketch.services.SongService;
import com.josiah.sketch.services.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private SongService songServ;
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private IdeaService ideaServ;
	
	@GetMapping("/")
	public String rIndex(
			@ModelAttribute("createAccount") User newUser,
			@ModelAttribute("newLogin") LoginUser loginUser 
			) {
		return "index.jsp";
	}
	
	@GetMapping("/register")
	public String rRegister(
			@ModelAttribute("newUser") User newUser,
			@ModelAttribute("login") LoginUser loginUser 
			) {
		return "register.jsp";
	}
	
	@PostMapping("/register")
    public String pRegister(
    		@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, 
            HttpSession session, 
            Model model
            ) {
            
        if(result.hasErrors()) {
        	model.addAttribute("newLogin", new LoginUser());
            return "register.jsp";
        }
        userServ.register(newUser, result); 
        session.setAttribute("id", newUser.getId());
        return "redirect:/home";
    }
	
	@PostMapping("/")
    public String pLogin(
    		@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result,
            HttpSession session,
            Model model
            ) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("id", user.getId());
        return "redirect:/home";
    }
	
	@GetMapping("/home")
    public String rDashboard( 
    		@ModelAttribute("newIdea") Idea newIdea,
    		HttpSession session,
    		Model model
    		) {
    	Long userId = (Long) session.getAttribute("id");
    	if(userId==null) {
    		return "redirect:/";
    	}
    	User user = userServ.findUser(userId);
    	List <Song> allSongs = songServ.allSongs();
    	List <Idea> allIdeas = user.getIdeas();
    	model.addAttribute("user", user);
    	model.addAttribute("allSongs", allSongs);
    	model.addAttribute("allIdeas", allIdeas);
    	return "dashboard.jsp";
    }
	
	@GetMapping("/new/{ideaID}")
	public String rNewTemplate(
			@PathVariable("ideaID") Long id, 
			@ModelAttribute("newSong") Song newSong, 
			BindingResult result,
			Model model
			) {
		Idea idea = ideaServ.findIdea(id);
		String randString = songServ.genRandSect();
		model.addAttribute(randString, idea.getText());
		model.addAttribute("ideaID", id);
		return "songForm2.jsp";
	}
	
	@DeleteMapping("/idea/{ideaID}/delete")
	public String pDelete(
			@PathVariable("ideaID") Long id,
			Model model
			) {
		ideaServ.deleteIdea(id);
		return "redirect:/home";
	}
	
	@PostMapping("/home")
	public String pNewIdea(
			@Valid @ModelAttribute("newIdea") Idea idea, 
			BindingResult result, 
			HttpSession session,
			Model model
			) {
		Long userId = (Long) session.getAttribute("id");
		
		if(result.hasErrors()) {
			model.addAttribute("addNewIdea", new Idea());
			User user = userServ.findUser(userId);
	    	List <Song> allSongs = songServ.allSongs();
	    	List <Idea> allIdeas = user.getIdeas();
	    	model.addAttribute("user", user);
	    	model.addAttribute("allSongs", allSongs);
	    	model.addAttribute("allIdeas", allIdeas);
			return "dashboard.jsp";
		}
		ideaServ.createOrUpdateIdea(idea, result);
		model.addAttribute("newIdea", new Idea());
		return "redirect:/home";
	}
	
	@GetMapping("/logout")
    public String rLogout(HttpSession session) {
   	 	session.setAttribute("id", null);
   	 	return "redirect:/";
    }
	
	@PostMapping("/new/{ideaID}")
	public String pNewSong(
			@PathVariable("ideaID") Long usedIdeaID,
			@Valid @ModelAttribute("newSong") Song song, 
			BindingResult result, 
			HttpSession session
			) {
		if(result.hasErrors()) {
			return "songForm2.jsp";
		}
		User thisUser = userServ.findUser((Long) session.getAttribute("id"));
//	HAD TO ADD WRITER TO SONG BEFORE CREATING THE SONG OTHER WISE
		song.getWriters().add(thisUser);
		Song thisSong = songServ.createOrUpdateSong(song);
		ideaServ.deleteIdea(usedIdeaID);
		
		return "redirect:/" + thisSong.getId();
	}
//	@PostMapping("/{songID}/update")
//	public String pUpdateSong(
//			@PathVariable("songID") Long id,
//			@Valid @ModelAttribute("editSong") Song song,
//			BindingResult result, 
//			HttpSession session,
//			Model model
//			) {
//		if(result.hasErrors()) {
//			model.addAttribute("Song", new Song());
//	    	Song thisSong = songServ.findSong(id);
//	    	model.addAttribute("song", thisSong);
//			return "editSongForm.jsp";
//		}
//		User thisUser = userServ.findUser((Long) session.getAttribute("id"));
//		song.getWriters().add(thisUser);
//		Song thisSong = songServ.createOrUpdateSong(song);
//		return "redirect:/" + thisSong.getId();
//	}
	@RequestMapping("/{songID}")
	public String rSong(
			@PathVariable("songID") Long songID, 
			HttpSession session,
			Model model
			) {
		User currentUser = userServ.findUser((Long) session.getAttribute("id"));
		Song currentSong = songServ.findSong(songID);
		model.addAttribute("song", currentSong);
		model.addAttribute("user", currentUser);
		return "song.jsp";
	}
	
	@GetMapping("/{songID}/edit")
	public String rEdit(
			@PathVariable("songID") Long id,
			@ModelAttribute("editSong") Song editSong,
			BindingResult result,
			Model model 
			) {
		Song song = songServ.findSong(id);
		model.addAttribute("song", song);
		return "editSongForm.jsp";
	}
	
	@PostMapping("/{songID}/update")
	public String pUpdateSong(
			@PathVariable("songID") Long id,
			@Valid @ModelAttribute("editSong") Song song,
			BindingResult result, 
			HttpSession session,
			Model model
			) {
		if(result.hasErrors()) {
			model.addAttribute("Song", new Song());
	    	Song thisSong = songServ.findSong(id);
	    	model.addAttribute("song", thisSong);
			return "editSongForm.jsp";
		}
		User thisUser = userServ.findUser((Long) session.getAttribute("id"));
		song.getWriters().add(thisUser);
		Song thisSong = songServ.createOrUpdateSong(song);
		return "redirect:/" + thisSong.getId();
	}
	
	@DeleteMapping("/song/{songID}/delete")
	public String pDeleteSong(@PathVariable("songID") Long id) {
		songServ.deleteSong(id);
		return "redirect:/home";
	}
}
