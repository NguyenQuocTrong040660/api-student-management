package com.system.api.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.system.api.entity.ScheduleEvaluate;

public interface ScheduleEvaluateRepository extends JpaRepository<ScheduleEvaluate, Integer> {
	
	
	 Optional<ScheduleEvaluate> findByScheduleId(Integer id);
}
