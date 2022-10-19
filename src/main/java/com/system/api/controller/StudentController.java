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
import com.system.api.entity.Student;
import com.system.api.model.ClazzDTO;
import com.system.api.model.StudentDTO;
import com.system.api.service.ClazzService;
import com.system.api.service.StudentService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class StudentController {
	

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private StudentService studentService;
	
    //convert Entity => DTO
	public StudentDTO convertIntoDto(Student student) {

		StudentDTO studentDTO = modelMapper.map(student, StudentDTO.class);
		return studentDTO;
	}

	//convert DTO => Entity
	public Student convertIntoEntity(StudentDTO studentDTO) {
		Student student = modelMapper.map(studentDTO, Student.class);
		return student;
	}
	
	
	//Get All
	@GetMapping("/students")
	public List<StudentDTO> getAllStudent(){
		
		return studentService.getAllStudent();
	}
	
	//create Student
	@PostMapping("/student")
	public ResponseEntity<StudentDTO> createStudent(@Valid @RequestBody StudentDTO studentDTO){
		
		return new ResponseEntity<StudentDTO>(studentService.saveStudent(studentDTO),HttpStatus.OK);
	}
	
	//get 1 entity
	@GetMapping("/student/{id}")
	public ResponseEntity<StudentDTO> getStudentById(@PathVariable Integer id) {

		Optional<Student> studentOptional = studentService.getStudent(id);
		return studentOptional.map(studentItem -> new ResponseEntity<>(convertIntoDto(studentItem), HttpStatus.OK))
				.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}
	
	
	//find Students  by clazz id
    // use to check VP Student by Chairman Teacher
	@GetMapping("/students/check-vp-hoc-sinh/{id}")
	
	public List<StudentDTO> getStudentsByClazzId(@PathVariable Integer id){
		
		return studentService.finByClazzId(id);
	}

     
	
	
}
