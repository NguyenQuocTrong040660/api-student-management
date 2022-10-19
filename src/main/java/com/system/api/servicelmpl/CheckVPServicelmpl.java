package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.CheckVP;
import com.system.api.model.CheckVPDTO;
import com.system.api.repository.CheckVPRepository;
import com.system.api.service.CheckVPService;

@Service
public class CheckVPServicelmpl implements CheckVPService {


	@Autowired
	private ModelMapper modelMapper;

	
	
    //convert Entity => DTO
	public CheckVPDTO convertIntoDto(CheckVP checkVP) {

		CheckVPDTO checkVPDTO = modelMapper.map(checkVP, CheckVPDTO.class);
		return checkVPDTO;
	}

	//convert DTO => Entity
	public CheckVP convertIntoEntity(CheckVPDTO checkVPDTO) {
		CheckVP checkVP = modelMapper.map(checkVPDTO, CheckVP.class);
		return checkVP;
	}
	
	@Autowired
	private CheckVPRepository checkVPRepository;
	
	
	@Override
	public List<CheckVPDTO> getAll() {
		
		return checkVPRepository.findAll().stream().map(this::convertIntoDto).toList();
	}

	@Override
	public CheckVPDTO saveCheckVP(CheckVPDTO checkVPDTO) {
		// TODO Auto-generated method stub
		return convertIntoDto(checkVPRepository.save(convertIntoEntity(checkVPDTO)));
	}

	@Override
	public Optional<CheckVP> getCheckVP(Integer id) {
		
		return checkVPRepository.findById(id);
	}

	@Override
	public void deleteById(Integer id) {
		checkVPRepository.deleteById(id);

	}

}
