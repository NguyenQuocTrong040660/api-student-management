package com.system.api.service;

import java.util.List;
import java.util.Optional;

import com.system.api.entity.Clazz;
import com.system.api.entity.ClazzTeacher;
import com.system.api.entity.CompositeKeyClazzTeacher;
import com.system.api.model.ClazzDTO;
import com.system.api.model.ClazzTeacherDTO;
import com.system.api.model.CompositeKeyClazzTeacherDTO;

public interface ClazzTeacherService {

	
	    // get ds ClazzTeacherDTO
		List<ClazzTeacherDTO> getClazzTeachers();

		// save 1 entity(Clazz)
		ClazzTeacherDTO saveClazzTeacher(ClazzTeacherDTO clazzTeacherDTO);

		// get 1 entity(Clazz) thong qua id
		Optional<ClazzTeacher> getClazzTeacher(CompositeKeyClazzTeacher id);
		
		Optional<ClazzTeacher> getClazz(Integer id,String roleClazz);
		
		List<ClazzTeacherDTO> getClazzByIdTeacher(Integer id);
		
		// update như save 
		ClazzTeacherDTO updateClazzTeacher(ClazzTeacherDTO clazzTeacherDTO);
		

	
	
}
