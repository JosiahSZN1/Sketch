package com.josiah.sketch.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josiah.sketch.models.Song;
import com.josiah.sketch.models.Verse;
import com.josiah.sketch.repositories.SongsRepository;

@Service
public class SongService {

	@Autowired
	private SongsRepository songsRepo;
	
	@Autowired
	private VerseService verseServ;
	
	@Autowired
	private UserService userServ;
	
	public Song createOrUpdateSong(Song s) {
		return songsRepo.save(s);
	}
	
	public List<Song> allSongs() {
		return songsRepo.findAll();
	}
	
	public Song findSong(Long id) {
		Optional<Song> optionalSong = songsRepo.findById(id);
		if(optionalSong.isPresent()) {
			return optionalSong.get();
		} else {
			return null;
		}
	}
	
	public Song addVerses(Long songID, Long verseID) {
		Song thisSong = this.findSong(songID);
		Verse thisVerse = verseServ.findVerse(verseID);
//		thisSong.getVerses().add(thisVerse);
		return songsRepo.save(thisSong);
	}
	
	
	
	public void deleteSong(Long id) {
		songsRepo.deleteById(id);
	}
}