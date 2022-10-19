package com.system.api.controller;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.Schedule;
import com.system.api.entity.Student;
import com.system.api.entity.Teacher;
import com.system.api.model.ScheduleDTO;
import com.system.api.model.StudentDTO;
import com.system.api.repository.ScheduleRepository;
import com.system.api.service.ScheduleService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class ScheduleController {
	@Autowired
	private ModelMapper modelMapper;

    //convert Entity => DTO
	public ScheduleDTO convertIntoDto(Schedule schedule) {

		ScheduleDTO scheduleDTO = modelMapper.map(schedule, ScheduleDTO.class);
		return scheduleDTO;
	}

	//convert DTO => Entity
	public Schedule convertIntoEntity(ScheduleDTO scheduleDTO) {
		Schedule student = modelMapper.map(scheduleDTO, Schedule.class);
		return student;
	}

	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private ScheduleRepository scheduleRepository;
	
	@GetMapping("/schedules")
	public List<ScheduleDTO> getAll(){
		return scheduleService.getAllSchedule();
	}
	
	@PostMapping("/schedule")
	public ResponseEntity<ScheduleDTO> save(@RequestBody ScheduleDTO scheduleDTO ){
		
		return new ResponseEntity<ScheduleDTO>(scheduleService.saveSchedule(scheduleDTO),HttpStatus.OK);
	}
	
	@PostMapping("/schedule-by-dates/{id}")
	public List<ScheduleDTO> getAll(@PathVariable Integer id){
		return scheduleService.getSchedulesByDatesWeek(id);
	}
	
	//update
	@PutMapping("/schedule-update/{id}")
	public ResponseEntity<ScheduleDTO> update(@PathVariable Integer id,@RequestBody ScheduleDTO scheduleDTO){
		
		Optional<Schedule> scheduleOptional = scheduleService.getSchedule(id);
		
		   return scheduleOptional.map(schedule->{
			   scheduleDTO.setId(schedule.getId());
			   return new ResponseEntity<>(scheduleService.updateSchedule(scheduleDTO), HttpStatus.OK);
		   }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
			
	}
	
	//Delete
	@DeleteMapping("/schedule/{id}")
	public void deleteSchedule(@PathVariable Integer id) {
		scheduleService.deleteById(id);
	}
	
	//get Schedule By id
	@GetMapping("/schedule/{id}")
	public ResponseEntity<ScheduleDTO> getScheduleById(@PathVariable Integer id) {

		Optional<Schedule> scheduleOptional = scheduleService.getSchedule(id);
		return scheduleOptional.map(item -> new ResponseEntity<>(convertIntoDto(item), HttpStatus.OK))
				.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}
	
	//update Status = false => Checked update else create Evaluate Schedule
	@PatchMapping("/schedule-update-status-false/{id}")
	public ResponseEntity<ScheduleDTO> updateStatus(@PathVariable Integer id) {
			Optional<Schedule> scheduleOptional = scheduleService.getSchedule(id);
			 return scheduleOptional.map(schedule->{
				   schedule.setStatus(false);
				   return new ResponseEntity<>(convertIntoDto(scheduleRepository.save(schedule)), HttpStatus.OK);
			   }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
				
	}
}
