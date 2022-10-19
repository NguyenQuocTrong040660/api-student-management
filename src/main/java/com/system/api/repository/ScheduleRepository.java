package com.system.api.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.system.api.entity.Schedule;
import com.system.api.model.ScheduleDTO;

public interface ScheduleRepository extends JpaRepository<Schedule, Integer> {
	
	
	List<Schedule> findByDatesWeekOrderByDateStartAscLessionAsc(Integer id);
	
	List<Schedule> findAllByOrderByDateStartAscLessionAsc();
    
	
}
