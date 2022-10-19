package com.system.api.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.DetailEvaluate;
import com.system.api.model.DetailEvaluateDTO;
import com.system.api.model.ScheduleEvaluateDTO;
import com.system.api.repository.DetailEvaluateRepository;
import com.system.api.service.DetailEvaluateService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class DetailEvalueController {

	@Autowired
	private ModelMapper modelMapper;

	// convert Entity => DTO
	public DetailEvaluateDTO convertIntoDto(DetailEvaluate detailEvaluate) {

		DetailEvaluateDTO detailEvaluateDTO = modelMapper.map(detailEvaluate, DetailEvaluateDTO.class);
		return detailEvaluateDTO;
	}

	// convert DTO => Entity
	public DetailEvaluate convertIntoEntity(DetailEvaluateDTO detailEvaluateDTO) {
		DetailEvaluate detailEvaluate = modelMapper.map(detailEvaluateDTO, DetailEvaluate.class);
		return detailEvaluate;
	}

	@Autowired
	private DetailEvaluateService detailEvaluateService;
	
	@Autowired
	private DetailEvaluateRepository detailEvaluateRepository;

	@GetMapping("/detail-evalue")
	public List<DetailEvaluateDTO> getAll() {
		return detailEvaluateService.getAllDetailEvaluate();
	}

	@PostMapping("/save-detail-evalue")
	public ResponseEntity<DetailEvaluateDTO> save(@RequestBody DetailEvaluateDTO detailEvaluateDTO) {

		return new ResponseEntity<DetailEvaluateDTO>(detailEvaluateService.saveDetailEvaluate(detailEvaluateDTO), HttpStatus.OK);
	}

	@GetMapping("/gets-by-schedule-evalueID/{id}")
	public List<DetailEvaluateDTO> getAllBySchedule(@PathVariable Integer id) {
		return detailEvaluateRepository.findAllByScheduleEvaluateId(id).stream().map(this::convertIntoDto).collect(Collectors.toList());
	}
	
	@DeleteMapping("/delete-detail-evalue/{id}")
	public void deleteDetailEvalue(@PathVariable Integer id) {
		detailEvaluateService.deleteById(id);
	}
}
