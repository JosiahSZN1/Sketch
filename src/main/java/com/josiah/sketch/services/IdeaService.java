package com.josiah.sketch.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josiah.sketch.models.Idea;
import com.josiah.sketch.repositories.IdeaRepository;

@Service
public class IdeaService {

	@Autowired
	private IdeaRepository ideaRepo;
	
	public Idea createOrUpdateIdea(Idea i) {
		return ideaRepo.save(i);
	}
	
	public List<Idea> allIdeas() {
		return ideaRepo.findAll();	
	}
	
	public Idea findIdea(Long id) {
		Optional<Idea> optionalIdea = ideaRepo.findById(id);
		if(optionalIdea.isPresent()) {
			return optionalIdea.get();
		} else {
			return null;
		}
	}
	
	public void deleteIdea(Long id) {
		ideaRepo.deleteById(id);
	}
}
