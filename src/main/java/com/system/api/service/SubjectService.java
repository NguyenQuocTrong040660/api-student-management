package com.system.api.service;

import java.util.List;
import java.util.Optional;

import com.system.api.entity.Subject;
import com.system.api.model.SubjectDTO;

public interface SubjectService {

	
	//get ds Subject
	List<SubjectDTO> getAllSubject();
	
	//save 1 entity(khoa)
	SubjectDTO saveSubject(SubjectDTO subject);
	
	//get 1 entity(khoa) thong qua id
	Optional<Subject> getSubject(Integer id);
	
	//update 1 entity(khoa) 
	SubjectDTO updateSubject(SubjectDTO subject);
	
	void deleteById(Integer id);
}
