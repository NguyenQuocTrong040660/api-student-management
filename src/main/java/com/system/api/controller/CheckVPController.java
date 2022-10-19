package com.system.api.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.CheckVP;
import com.system.api.entity.Student;
import com.system.api.model.CheckVPDTO;
import com.system.api.model.StudentDTO;
import com.system.api.service.CheckVPService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class CheckVPController {
	

	@Autowired
	private ModelMapper modelMapper;

    //convert Entity => DTO
	public CheckVPDTO convertIntoDto(CheckVP checkVP) {

		CheckVPDTO checkVPDTO = modelMapper.map(checkVP, CheckVPDTO.class);
		return checkVPDTO;
	}

	//convert DTO => Entity
	public CheckVP convertIntoEntity(CheckVPDTO checkVPDTO) {
		CheckVP checkVP = modelMapper.map(checkVPDTO, CheckVP.class);
		return checkVP;
	}
	@Autowired
	private CheckVPService checkVPService;
	

	//Get All
	@GetMapping("/check-vps")
	public List<CheckVPDTO> getAllCheckVP(){
		
		return checkVPService.getAll();
	}
	
	//create Student
	@PostMapping("/check-vp")
	public ResponseEntity<CheckVPDTO> createCheckVP(@Valid @RequestBody CheckVPDTO checkVPDTO){
		
		return new ResponseEntity<CheckVPDTO>(checkVPService.saveCheckVP(checkVPDTO),HttpStatus.OK);
	}
	
	//get 1 entity
	@GetMapping("/check-vp/{id}")
	public ResponseEntity<CheckVPDTO> getStudentById(@PathVariable Integer id) {

		Optional<CheckVP> checkVPOptional = checkVPService.getCheckVP(id);
		return checkVPOptional.map(checkVPitem -> new ResponseEntity<>(convertIntoDto(checkVPitem), HttpStatus.OK))
				.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}
	
	//Delete
	@DeleteMapping("check-vp/{id}")
	public void deleteCheckVPById(@PathVariable Integer id) {
		checkVPService.deleteById(id);
	}
	
	

}
