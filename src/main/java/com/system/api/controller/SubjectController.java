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

import com.system.api.entity.Clazz;
import com.system.api.entity.Offence;
import com.system.api.entity.Subject;
import com.system.api.model.ClazzDTO;
import com.system.api.model.OffenceDTO;
import com.system.api.model.SubjectDTO;
import com.system.api.service.SubjectService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class SubjectController {
	
	@Autowired
	private ModelMapper modelMapper;
	
	//convert Entity => DTO
		public SubjectDTO convertIntoDto(Subject subject) {

			SubjectDTO subjectDTO = modelMapper.map(subject, SubjectDTO.class);
			return subjectDTO;
		}

		//convert DTO => Entity
		public Subject convertIntoEntity(SubjectDTO subjectDTO) {
			Subject subject = modelMapper.map(subjectDTO, Subject.class);
			return subject;
		}
		
		@Autowired
		private SubjectService subjectService;

    
    @GetMapping("/subjects")
    public List<SubjectDTO> getAll(){
    	return subjectService.getAllSubject();
    }
    
    @PostMapping("/subject")
    public ResponseEntity<SubjectDTO> home(@Valid @RequestBody SubjectDTO subjectDTO) {
		// call service
		return new ResponseEntity<SubjectDTO>(subjectService.saveSubject(subjectDTO),HttpStatus.OK);
	}
    
	@GetMapping("/subject/{id}")
	public ResponseEntity<SubjectDTO> getOffenceById(@PathVariable Integer id) {

		Optional<Subject> subjectOptional = subjectService.getSubject(id);
		return subjectOptional.map(item -> new ResponseEntity<>(convertIntoDto(item), HttpStatus.OK))
				.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}
	
	
	
	
   
	
}
