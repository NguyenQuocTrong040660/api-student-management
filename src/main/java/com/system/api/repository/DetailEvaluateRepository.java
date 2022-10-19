package com.system.api.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.system.api.entity.DetailEvaluate;

public interface DetailEvaluateRepository extends JpaRepository<DetailEvaluate, Integer> {
	
	List<DetailEvaluate> findAllByScheduleEvaluateId(Integer id);
}