package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.Teacher;
import com.system.api.model.TeacherDTO;
import com.system.api.repository.TeacherRepository;
import com.system.api.service.TeacherService;

@Service
public class TeacherServicelmpl implements TeacherService {
	
	
	@Autowired
	private ModelMapper modelMapper;


	
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
	
    
	@Autowired
	private TeacherRepository teacherRepository;
	
	@Override
	public List<TeacherDTO> getAllTeacher(boolean status) {
		
		return teacherRepository.findAllByStatus(status).stream().map(this::convertIntoDto).toList();
	}

	@Override
	public TeacherDTO saveTeacher(TeacherDTO teacher) {
		
		return convertIntoDto(teacherRepository.save(convertIntoEntity(teacher)));
	}

	@Override
	public Optional<Teacher> getTeacher(Integer id) {
		return teacherRepository.findById(id);
		 
	}

	@Override
	public TeacherDTO updateTeacher(TeacherDTO teacher) {
		
		return convertIntoDto(teacherRepository.save(convertIntoEntity(teacher)));
	}

	@Override
	public void deleteById(Integer id) {
		teacherRepository.deleteById(id);

	}

	@Override
	public Optional<Teacher> findByEmail(String email) {
		
		return teacherRepository.findByEmail(email);
	}

}
