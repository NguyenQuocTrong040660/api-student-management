package com.system.api.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.system.api.entity.Mark;

public interface MarkRepository extends JpaRepository<Mark, Integer> {
	
	List<Mark> findBySubjectIdAndSemesterAndStudentId(Integer idSubject,Integer semester,Integer studentId);

}
