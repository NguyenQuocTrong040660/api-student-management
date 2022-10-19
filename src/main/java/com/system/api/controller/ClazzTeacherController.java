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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.ClazzTeacher;
import com.system.api.entity.CompositeKeyClazzTeacher;
import com.system.api.entity.Student;
import com.system.api.entity.Teacher;
import com.system.api.model.ClazzTeacherDTO;
import com.system.api.model.CompositeKeyClazzTeacherDTO;
import com.system.api.model.StudentDTO;
import com.system.api.model.TeacherDTO;
import com.system.api.repository.ClazzTeacherRepository;
import com.system.api.service.ClazzTeacherService;
import com.system.api.service.TeacherService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class ClazzTeacherController {
	
	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private ClazzTeacherService clazzTeacherService;
	
	@Autowired
	private ClazzTeacherRepository clazzTeacherRepository;
	
    //convert Entity => DTO
	public ClazzTeacherDTO convertIntoDto(ClazzTeacher clazzTeacher) {

		ClazzTeacherDTO clazzTeacherDTO = modelMapper.map(clazzTeacher, ClazzTeacherDTO.class);
		return clazzTeacherDTO;
	}

	//convert DTO => Entity
	public ClazzTeacher convertIntoEntity(ClazzTeacherDTO clazzTeacherDTO) {
		ClazzTeacher clazzTeacher = modelMapper.map(clazzTeacherDTO, ClazzTeacher.class);
		return clazzTeacher;
	}
	
	
	@GetMapping("/clazzs-teachers")
	public List<ClazzTeacherDTO> getClazzTeachers() {

		return clazzTeacherService.getClazzTeachers();

	} 
	
	//save
	@PostMapping("/clazzs-teachers")
	public ResponseEntity<ClazzTeacherDTO> saveClazzTeachers(@RequestBody ClazzTeacherDTO clazzTeacherDTO ) {

		return new ResponseEntity<>(clazzTeacherService.saveClazzTeacher(clazzTeacherDTO), HttpStatus.OK);

	} 
	
	//get role quan nhiem
	@GetMapping("/clazz-teacher/{id}")
	public ResponseEntity<ClazzTeacherDTO> getClazzhaveChairman(@PathVariable Integer id) {

		Optional<ClazzTeacher> studentOptional = clazzTeacherService.getClazz(id, "Quản nhiệm");
		return studentOptional.map(studentItem -> new ResponseEntity<>(convertIntoDto(studentItem), HttpStatus.OK))
				.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	

	} 
	
	//get id
	@PostMapping("/clazz-teacher/{id}")
	public List<ClazzTeacherDTO> getClazzByTeacherId(@PathVariable Integer id) {

		return clazzTeacherService.getClazzByIdTeacher(id);
		

	} 
	
	//get Clazz teacher By CompositeKey id
	@PostMapping("/clazz-teacher/")
	public ResponseEntity<ClazzTeacherDTO> getClazzTeacherByIdcompositeKey(@RequestBody CompositeKeyClazzTeacher id) {

		Optional<ClazzTeacher> studentOptional = clazzTeacherService.getClazzTeacher(id);
		return studentOptional.map(studentItem -> new ResponseEntity<>(convertIntoDto(studentItem), HttpStatus.OK))
				.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	

	} 
	
	//update
	@PutMapping("/update-clazz-teacher/")
	public ResponseEntity<ClazzTeacherDTO> update(@RequestBody ClazzTeacherDTO clazzTeacherDTO ) {

		return new ResponseEntity<>(clazzTeacherService.saveClazzTeacher(clazzTeacherDTO), HttpStatus.OK);

	} 
	
	
	
	//delete
	@PostMapping("/delete-clazz-teacher/")
	public void delete(@RequestBody CompositeKeyClazzTeacher id ) {
		Optional<ClazzTeacher> items = clazzTeacherService.getClazzTeacher(id);
		if (items.isPresent()) {
			ClazzTeacher clazzTeacher = items.get();
			clazzTeacherRepository.delete(clazzTeacher);
		}

	} 
	

}
