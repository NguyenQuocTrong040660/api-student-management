package com.system.api.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.Offence;
import com.system.api.entity.StudentFamily;
import com.system.api.model.OffenceDTO;
import com.system.api.model.StudentFamilyDTO;
import com.system.api.service.OffenceService;
import com.system.api.service.StudentFamilyService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class StudentFamilyController {
	
	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private StudentFamilyService studentFamilyService;

	public StudentFamilyDTO convertIntoDto(StudentFamily studentFamily) {

		StudentFamilyDTO studentFamilyDTO = modelMapper.map(studentFamily, StudentFamilyDTO.class);
		return studentFamilyDTO;
	}

	public StudentFamily convertIntoEntity(StudentFamilyDTO studentFamilyDTO) {
		StudentFamily studentFamily = modelMapper.map(studentFamilyDTO, StudentFamily.class);
		return studentFamily;
	}
	
	
	//Create StudentFamilyDTO
	@PostMapping("/student-family")
	public ResponseEntity<StudentFamilyDTO> createStudentFamily(@Valid @RequestBody StudentFamilyDTO studentFamilyDTO ){
		
		return new  ResponseEntity<StudentFamilyDTO>(studentFamilyService.saveStudentFamily(studentFamilyDTO),HttpStatus.OK);
	}
	
	
	//Create StudentFamilyDTO
		@GetMapping("/student-familys")
		public List<StudentFamilyDTO> getStudentFamilys(){
			
			return studentFamilyService.getAllStudentFamily();
		}
		
		
		//get StudentFamily by Id
		
		@GetMapping("/student-family/{id}")
		public ResponseEntity<StudentFamilyDTO> getStudentFamilyById(@PathVariable Integer id){

			Optional<StudentFamily> studentFamilyOptional = studentFamilyService.getStudentFamily(id);
			return studentFamilyOptional.map(studentFamily -> new ResponseEntity<>(convertIntoDto(studentFamily), HttpStatus.OK))
					.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
		}

}
