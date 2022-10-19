package com.system.api.service;

import java.util.List;
import java.util.Optional;

import com.system.api.entity.Student;
import com.system.api.model.StudentDTO;

public interface StudentService {
	   //get ds Student
		List<StudentDTO> getAllStudent();
		
		//save 1 entity(khoa)
		StudentDTO saveStudent(StudentDTO student);
		
		//get 1 entity(khoa) thong qua id
		Optional<Student> getStudent(Integer id);
		
		//update 1 entity(khoa) 
		Student updateStudent(Student student);
		
		void deleteById(Integer id);
		
		List<StudentDTO> finByClazzId(Integer id);
}
