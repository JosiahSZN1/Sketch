package com.josiah.sketch.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josiah.sketch.models.Chorus;
import com.josiah.sketch.repositories.ChorusRepository;

@Service
public class ChorusService {
	@Autowired
	private ChorusRepository chorusRepo;
	
	public Chorus createOrUpdateChorus(Chorus c) {
		return chorusRepo.save(c);
	}
	
	public List<Chorus> allChoruses() {
		return chorusRepo.findAll();
	}
	
	public Chorus findChorus(Long id) {
		Optional<Chorus> optionalChorus = chorusRepo.findById(id);
		if(optionalChorus.isPresent()) {
			return optionalChorus.get();
		} else {
			return null;
		}
	}
	
	public void deleteChorus(Long id) {
		chorusRepo.deleteById(id);
	}
}