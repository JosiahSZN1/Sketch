package com.josiah.sketch.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.josiah.sketch.models.User;

@Repository
public interface UsersRepository extends CrudRepository<User, Long> {
	Optional<User> findByEmail(String email);
	Optional<User> findById(Long id);
	Optional<User> findByUserName(String userName);
	List<User> findAll();
	
}
