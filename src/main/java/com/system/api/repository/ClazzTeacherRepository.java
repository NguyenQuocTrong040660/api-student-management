package com.system.api.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.system.api.entity.ClazzTeacher;
import com.system.api.entity.CompositeKeyClazzTeacher;
import com.system.api.entity.Teacher;
import com.system.api.model.ClazzTeacherDTO;
import com.system.api.model.CompositeKeyClazzTeacherDTO;

public interface ClazzTeacherRepository extends JpaRepository<ClazzTeacher, CompositeKeyClazzTeacher> {

	Optional<ClazzTeacher> findByTeacherIdAndRoleClazz(Integer id,String roleClazz);
	
	List<ClazzTeacher> findByTeacherId(Integer id);
	
	Optional<ClazzTeacher> findById(CompositeKeyClazzTeacher id);
	
	
	
	
}
