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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.Clazz;
import com.system.api.entity.Teacher;
import com.system.api.model.ClazzDTO;
import com.system.api.model.TeacherDTO;
import com.system.api.service.TeacherService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class TeacherController {
	
	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private TeacherService teacherService;
	
    //convert Entity => DTO
	public TeacherDTO convertIntoDto(Teacher teacher) {

		TeacherDTO teacherDTO = modelMapper.map(teacher, TeacherDTO.class);
		return teacherDTO;
	}

	//convert DTO => Entity
	public Teacher convertIntoEntity(TeacherDTO teacherDTO) {
		Teacher teacher = modelMapper.map(teacherDTO, Teacher.class);
		return teacher;
	}
	
	//get All
	@GetMapping("/teachers")
	public List<TeacherDTO> getAllPosts() {

		return teacherService.getAllTeacher(true);

	}
	
	//create
	//@PostMapping("/teacher")
	
	public ResponseEntity<TeacherDTO> home(@Valid @RequestBody TeacherDTO teacherDTO) {
		// call service
		return new ResponseEntity<TeacherDTO>(teacherService.saveTeacher(teacherDTO),HttpStatus.OK);

	}
	
	    //get 1 entity
		@GetMapping("/teacher/{id}")
		public ResponseEntity<TeacherDTO> getOffenceById(@PathVariable Integer id) {

			Optional<Teacher> teacherOptional = teacherService.getTeacher(id);
			return teacherOptional.map(teacher -> new ResponseEntity<>(convertIntoDto(teacher), HttpStatus.OK))
					.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
		}
		
		
		
		// update information
		@PutMapping("/teacher/{id}")
		public ResponseEntity<TeacherDTO> updateTeacher(@PathVariable Integer id, @RequestBody TeacherDTO teacherDTO) {
			Optional<Teacher> teacherOptional = teacherService.getTeacher(id);
			
		   return teacherOptional.map(teacher->{
			   teacherDTO.setId(teacher.getId());
			   return new ResponseEntity<>(teacherService.updateTeacher(teacherDTO), HttpStatus.OK);
		   }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
			
		}
		
		//check Role Admin
		
		@GetMapping("/checkRoleAmin")
		public String chekRoleAdmin( ) {
			 return "sucess";
		   
		}
		
		//delete Teacher By update Status
		@PutMapping("/teacher-delete/{id}")
		public ResponseEntity<TeacherDTO> deleteClazzById(@PathVariable Integer id,@RequestBody TeacherDTO teacherDTO) {
			Optional<Teacher> teacherOptional = teacherService.getTeacher(id);
			
			 return teacherOptional.map(teacher->{
				   teacherDTO.setStatus(false);
				   return new ResponseEntity<>(teacherService.updateTeacher(teacherDTO), HttpStatus.OK);
			   }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
				
		}
	
	
	
	
	

}
