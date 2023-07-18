package com.josiah.sketch.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.josiah.sketch.models.Song;

public interface SongsRepository extends CrudRepository<Song, Long> {
	List<Song> findAll();
	Optional<Song> findById(Long id);
	void deleteById(Long id);
}