package com.system.api.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.system.api.entity.Offence;
import com.system.api.entity.Teacher;
import com.system.api.model.TeacherDTO;


public interface TeacherService {
	        //authen
	
	      Optional<Teacher> findByEmail(String email);
	
	    
	
	        //End Authen
	
	       //get ds Teacher
			List<TeacherDTO> getAllTeacher(boolean status);
			
			//save 1 entity(khoa)
			TeacherDTO saveTeacher(TeacherDTO teacher);
			
			//get 1 entity(khoa) thong qua id
			Optional<Teacher> getTeacher(Integer id);
			
			//update 1 entity(khoa) 
			TeacherDTO updateTeacher(TeacherDTO teacher);
			
			void deleteById(Integer id);
			

}
