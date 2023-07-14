package com.josiah.sketch.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.josiah.sketch.models.Verse;

@Repository
public interface VerseRepository extends CrudRepository<Verse, Long> {

	List<Verse> findAll();
}