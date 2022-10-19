package com.system.api.service;

import java.util.List;
import java.util.Optional;

import com.system.api.entity.StudentFamily;
import com.system.api.model.StudentFamilyDTO;

public interface StudentFamilyService {
	
	         //get ds StudentFamily
			List<StudentFamilyDTO> getAllStudentFamily();
			
			//save 1 entity(studentFamily)
			StudentFamilyDTO saveStudentFamily(StudentFamilyDTO studentFamily);
			
			//get 1 entity(khoa) thong qua id
			Optional<StudentFamily> getStudentFamily(Integer id);
			
			//update 1 entity(studentFamily) 
			StudentFamily updateStudentFamily(StudentFamily studentFamily);
			
			void deleteById(Integer id);

}
