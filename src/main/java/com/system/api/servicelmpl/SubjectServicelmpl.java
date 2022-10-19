package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.Student;
import com.system.api.entity.Subject;
import com.system.api.model.StudentDTO;
import com.system.api.model.SubjectDTO;
import com.system.api.repository.SubjectRepository;
import com.system.api.service.SubjectService;


@Service
public class SubjectServicelmpl implements SubjectService {
	
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
	private SubjectRepository subjectRepository;

	@Override
	public List<SubjectDTO> getAllSubject() {
		
		return subjectRepository.findAll().stream().map(this::convertIntoDto).collect(Collectors.toList());
	}

	@Override
	public SubjectDTO saveSubject(SubjectDTO subjectDTO) {
		
		return convertIntoDto(subjectRepository.save(convertIntoEntity(subjectDTO)));
	}

	@Override
	public Optional<Subject> getSubject(Integer id) {
		
			 return subjectRepository.findById(id)  ;
		
		
	}

	@Override
	public SubjectDTO updateSubject(SubjectDTO subject) {
		
		return convertIntoDto(subjectRepository.save(convertIntoEntity(subject)));
	}

	@Override
	public void deleteById(Integer id) {
		subjectRepository.deleteById(id);

	}

}
