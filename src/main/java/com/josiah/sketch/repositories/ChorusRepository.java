package com.josiah.sketch.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.josiah.sketch.models.Chorus;

public interface ChorusRepository extends CrudRepository<Chorus, Long> {

	List<Chorus> findAll();
}