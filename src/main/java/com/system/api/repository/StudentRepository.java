package com.system.api.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.system.api.entity.Student;
import com.system.api.model.StudentDTO;

public interface StudentRepository extends JpaRepository<Student, Integer>  {
	
	
	List<Student> findByClazzId(Integer id);
	

}
