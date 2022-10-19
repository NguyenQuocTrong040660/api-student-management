package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.ClazzTeacher;
import com.system.api.entity.CompositeKeyClazzTeacher;
import com.system.api.model.ClazzDTO;
import com.system.api.model.ClazzTeacherDTO;
import com.system.api.model.CompositeKeyClazzTeacherDTO;
import com.system.api.repository.ClazzTeacherRepository;
import com.system.api.service.ClazzTeacherService;

@Service
public class ClazzTeacherServicelmpl implements ClazzTeacherService {

	@Autowired
	private ModelMapper modelMapper;

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
	
	
	@Override
	public List<ClazzTeacherDTO> getClazzTeachers() {
		
		return clazzTeacherRepository.findAll().stream().map(this::convertIntoDto).toList();
	}


	@Override
	public Optional<ClazzTeacher> getClazzTeacher(CompositeKeyClazzTeacher id) {
		
		return clazzTeacherRepository.findById(id);
	}

	@Override
	public Optional<ClazzTeacher> getClazz(Integer id, String roleClazz) {
		
		return clazzTeacherRepository.findByTeacherIdAndRoleClazz(id, roleClazz);
	}

	@Override
	public List<ClazzTeacherDTO> getClazzByIdTeacher(Integer id) {
		
		return clazzTeacherRepository.findByTeacherId(id).stream().map(this::convertIntoDto).toList();
				
	}

	@Override
	public ClazzTeacherDTO saveClazzTeacher(ClazzTeacherDTO clazzTeacherDTO) {
		
		return convertIntoDto(clazzTeacherRepository.save(convertIntoEntity(clazzTeacherDTO)));
	}

	@Override
	public ClazzTeacherDTO updateClazzTeacher(ClazzTeacherDTO clazzTeacherDTO) {
		
		return convertIntoDto(clazzTeacherRepository.save(convertIntoEntity(clazzTeacherDTO)));
	}

}
