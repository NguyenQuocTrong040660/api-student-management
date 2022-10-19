package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.Schedule;
import com.system.api.entity.Student;
import com.system.api.model.StudentDTO;
import com.system.api.repository.StudentRepository;
import com.system.api.service.StudentService;

@Service
public class StudentServicelmpl implements StudentService {
	
	@Autowired
	private ModelMapper modelMapper;

	
	
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
	
	@Autowired
	private StudentRepository studentRepository;

	@Override
	public List<StudentDTO> getAllStudent() {
		
		return studentRepository.findAll().stream().map(this::convertIntoDto).collect(Collectors.toList());
	}

	@Override
	public StudentDTO saveStudent(StudentDTO student) {
		
		return convertIntoDto(studentRepository.save(convertIntoEntity(student)));
	}

	@Override
	public Optional<Student> getStudent(Integer id) {
		return  studentRepository.findById(id);
		 
	}

	@Override
	public Student updateStudent(Student student) {
		
		return studentRepository.save(student);
	}

	@Override
	public void deleteById(Integer id) {
		studentRepository.deleteById(id);

	}

	@Override
	public List<StudentDTO> finByClazzId(Integer id) {
		
		return studentRepository.findByClazzId(id).stream().map(this::convertIntoDto).collect(Collectors.toList());
	}

}
