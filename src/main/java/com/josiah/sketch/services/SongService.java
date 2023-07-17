package com.josiah.sketch.services;

import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josiah.sketch.models.Song;
import com.josiah.sketch.repositories.SongsRepository;

@Service
public class SongService {

	@Autowired
	private SongsRepository songsRepo;
	
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
	
	public String genRandSect() {
	    Random rand = new Random();
	    List<String> givenList = Arrays.asList("titleIdea", "themeIdea", "verse1Line1idea", "verse1Line2idea", "verse1Line3idea", "verse1Line4idea", "chorusLine1idea", "chorusLine2idea", "chorusLine3idea", "chorusLine4idea", "verse2Line1idea", "verse2Line2idea", "verse2Line3idea", "verse2Line4idea", "bridgeLine1idea", "bridgeLine2idea", "bridgeLine3idea", "bridgeLine4idea");

	    int numberOfElements = 18;
	    String randomElement = "";
	    for (int i = 0; i < numberOfElements; i++) {
	        int randomIndex = rand.nextInt(givenList.size());
	        randomElement = givenList.get(randomIndex);
	    }
	    return randomElement;
	}
	
	public void deleteSong(Long id) {
		songsRepo.deleteById(id);
	}
}