package com.system.api.service;

import java.util.List;
import java.util.Optional;

import com.system.api.entity.Schedule;
import com.system.api.entity.ScheduleEvaluate;
import com.system.api.model.ScheduleEvaluateDTO;

public interface ScheduleEvaluateService {
	
	   //get ds ScheduleEvaluate
		List<ScheduleEvaluateDTO> getAllScheduleEvaluate();
		
		//save 1 entity(ScheduleEvaluate)
		ScheduleEvaluateDTO saveScheduleEvaluate(ScheduleEvaluateDTO scheduleEvaluateDTO);
		
		//get 1 entity(ScheduleEvaluate) thong qua id
		Optional<ScheduleEvaluate> getScheduleEvaluate(Integer id);
		
		//update 1 entity(ScheduleEvaluate) 
		ScheduleEvaluateDTO updateScheduleEvaluate(ScheduleEvaluateDTO scheduleEvaluateDTO);
		
		void deleteById(Integer id);
		
		Optional<ScheduleEvaluate> findByScheduleId(Integer id);
		

}
