package com.system.api.controller;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.Schedule;
import com.system.api.entity.ScheduleEvaluate;
import com.system.api.entity.Student;
import com.system.api.model.ScheduleDTO;
import com.system.api.model.ScheduleEvaluateDTO;
import com.system.api.model.StudentDTO;
import com.system.api.service.ScheduleEvaluateService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class ScheduleEvalueController {
	@Autowired
	private ModelMapper modelMapper;

	// convert Entity => DTO
	public ScheduleEvaluateDTO convertIntoDto(ScheduleEvaluate scheduleEvalue) {

		ScheduleEvaluateDTO scheduleEvaluateDTO = modelMapper.map(scheduleEvalue, ScheduleEvaluateDTO.class);
		return scheduleEvaluateDTO;
	}

	// convert DTO => Entity
	public ScheduleEvaluate convertIntoEntity(ScheduleEvaluateDTO scheduleEvalueDTO) {
		ScheduleEvaluate scheduleEvaluate = modelMapper.map(scheduleEvalueDTO, ScheduleEvaluate.class);
		return scheduleEvaluate;
	}
	
	@Autowired
	private ScheduleEvaluateService scheduleEvaluateService;
	
	@GetMapping("/schedules-evalue/")
	public List<ScheduleEvaluateDTO> getAll(){
		return scheduleEvaluateService.getAllScheduleEvaluate();
	}
	
	@PostMapping("/schedules-evalue/")
	public ResponseEntity<ScheduleEvaluateDTO> save(@RequestBody ScheduleEvaluateDTO scheduleEvaluateDTO ){
		
		return new ResponseEntity<ScheduleEvaluateDTO>(scheduleEvaluateService.saveScheduleEvaluate(scheduleEvaluateDTO),HttpStatus.OK);
	}
	
	@GetMapping("/schedules-evalue/{id}")
	public ResponseEntity<ScheduleEvaluateDTO> getscheduleEvalueById(@PathVariable Integer id) {

		Optional<ScheduleEvaluate> optional = scheduleEvaluateService.getScheduleEvaluate(id);
		return optional.map(Item -> new ResponseEntity<>(convertIntoDto(Item), HttpStatus.OK))
				.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}
	
	//get entity By Id of Schedule
	@GetMapping("/schedules-evalue-by-schedule/{id}")
	public ResponseEntity<ScheduleEvaluateDTO> getscheduleEvalueByScheduleId(@PathVariable Integer id) {

		Optional<ScheduleEvaluate> optional = scheduleEvaluateService.findByScheduleId(id);
		return optional.map(Item -> new ResponseEntity<>(convertIntoDto(Item), HttpStatus.OK))
				.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}

	
	//update
		@PutMapping("/update-schedule-value/{id}")
		public ResponseEntity<ScheduleEvaluateDTO> update(@PathVariable Integer id,@RequestBody ScheduleEvaluateDTO scheduleEvaluateDTO){
			
			Optional<ScheduleEvaluate> optional = scheduleEvaluateService.getScheduleEvaluate(id);
			
			   return optional.map(item->{
				   scheduleEvaluateDTO.setId(item.getId());
				   return new ResponseEntity<>(scheduleEvaluateService.updateScheduleEvaluate(scheduleEvaluateDTO), HttpStatus.OK);
			   }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
				
		}
	
}
