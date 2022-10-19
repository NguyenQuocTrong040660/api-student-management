package com.system.api.service;

import java.util.List;
import java.util.Optional;

import com.system.api.entity.Schedule;
import com.system.api.entity.Student;
import com.system.api.model.ScheduleDTO;

public interface ScheduleService {

	 //get ds Schedule
	List<ScheduleDTO> getAllSchedule();
	
	//save 1 entity(Schedule)
	 ScheduleDTO saveSchedule( ScheduleDTO schedule);
	
	//get 1 entity(Schedule) thong qua id
	 Optional<Schedule> getSchedule(Integer id);
	
	//update 1 entity(Schedule) 
	ScheduleDTO updateSchedule(ScheduleDTO scheduledTO);
	
	void deleteById(Integer id);
	
	List<ScheduleDTO> getSchedulesByDatesWeek(Integer id);
	
	
}
