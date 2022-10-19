package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.Clazz;
import com.system.api.model.ClazzDTO;
import com.system.api.repository.ClazzRepository;
import com.system.api.service.ClazzService;


@Service
public class ClazzServicelmpl implements ClazzService {
	
	
	@Autowired
	private ModelMapper modelMapper;

	
	
    //convert Entity => DTO
	public ClazzDTO convertIntoDto(Clazz clazz) {

		ClazzDTO clazzDTO = modelMapper.map(clazz, ClazzDTO.class);
		return clazzDTO;
	}

	//convert DTO => Entity
	public Clazz convertIntoEntity(ClazzDTO clazzDTO) {
		Clazz clazz = modelMapper.map(clazzDTO, Clazz.class);
		return clazz;
	}
	
	@Autowired
	private ClazzRepository clazzRepository;

	@Override
	public List<ClazzDTO> getAllClazz() {
		
		return clazzRepository.findAll().stream().map(this::convertIntoDto).toList();
	}

	@Override
	public ClazzDTO saveClazz(ClazzDTO clazz) {
		
		return convertIntoDto(clazzRepository.save(convertIntoEntity(clazz)));
	}

	@Override
	public  Optional<Clazz> getClazz(Integer id) {
		return  clazzRepository.findById(id);
		 
	}
	

	@Override
	public ClazzDTO updateClazz(ClazzDTO clazz) {
		
		return convertIntoDto(clazzRepository.save(convertIntoEntity(clazz)));
	}

	@Override
	public void deleteById(Integer id) {
		
		clazzRepository.deleteById(id);

	}

	@Override
	public List<ClazzDTO> findAllByStatus(boolean status) {
		
		return clazzRepository.findAllByStatus(status).stream().map(this::convertIntoDto).toList();
		
	}

}
