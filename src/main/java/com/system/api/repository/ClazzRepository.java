package com.system.api.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.system.api.entity.Clazz;
import com.system.api.entity.ClazzTeacher;
import com.system.api.entity.Dates;

public interface ClazzRepository extends JpaRepository<Clazz, Integer> {
	
	List<Clazz>findAllByStatus(boolean status);

}
