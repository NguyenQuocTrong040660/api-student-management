package com.system.api.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.system.api.entity.Teacher;

public interface TeacherRepository extends JpaRepository<Teacher, Integer> {
	
	Optional<Teacher> findByEmail(String username);
	
	Boolean existsByEmail(String email);
	
	List<Teacher> findAllByStatus(boolean status);

}
