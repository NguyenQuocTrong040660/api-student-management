package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.Offence;
import com.system.api.entity.StudentFamily;
import com.system.api.model.OffenceDTO;
import com.system.api.model.StudentFamilyDTO;
import com.system.api.repository.StudentFamilyRepository;
import com.system.api.service.StudentFamilyService;

@Service
public class StudentFamilyServicelmpl implements StudentFamilyService {
	
	@Autowired
	private StudentFamilyRepository studentFamilyRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	

	public StudentFamilyDTO convertIntoDto(StudentFamily studentFamily) {

		StudentFamilyDTO studentFamilyDTO = modelMapper.map(studentFamily, StudentFamilyDTO.class);
		return studentFamilyDTO;
	}

	public StudentFamily convertIntoEntity(StudentFamilyDTO studentFamilyDTO) {
		StudentFamily studentFamily = modelMapper.map(studentFamilyDTO, StudentFamily.class);
		return studentFamily;
	}
	
	
	
    //get All
	@Override
	public List<StudentFamilyDTO> getAllStudentFamily() {
		
		return studentFamilyRepository.findAll().stream().map(this::convertIntoDto).toList();
	}

	
	 //create StudentFamily
	@Override
	public StudentFamilyDTO saveStudentFamily(StudentFamilyDTO studentFamily) {
		
		return convertIntoDto(studentFamilyRepository.save(convertIntoEntity(studentFamily)));
	}

	 //get StudentFamily by id
	@Override
	public Optional<StudentFamily> getStudentFamily(Integer id) {
		return  studentFamilyRepository.findById(id);
		
	}

	@Override
	public StudentFamily updateStudentFamily(StudentFamily studentFamily) {
		
		return studentFamilyRepository.save(studentFamily);
	}

	@Override
	public void deleteById(Integer id) {
		

	}

}
