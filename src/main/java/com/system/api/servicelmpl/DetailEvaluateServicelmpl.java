package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.DetailEvaluate;
import com.system.api.entity.ScheduleEvaluate;
import com.system.api.model.DetailEvaluateDTO;
import com.system.api.model.ScheduleEvaluateDTO;
import com.system.api.repository.DetailEvaluateRepository;
import com.system.api.service.DetailEvaluateService;


@Service
public class DetailEvaluateServicelmpl implements DetailEvaluateService {
	
	
	@Autowired
	private ModelMapper modelMapper;

	// convert Entity => DTO
	public DetailEvaluateDTO convertIntoDto(DetailEvaluate detailEvaluate) {

		DetailEvaluateDTO detailEvaluateDTO = modelMapper.map(detailEvaluate, DetailEvaluateDTO.class);
		return detailEvaluateDTO;
	}

	// convert DTO => Entity
	public DetailEvaluate convertIntoEntity(DetailEvaluateDTO detailEvaluateDTO) {
		DetailEvaluate detailEvaluate = modelMapper.map(detailEvaluateDTO, DetailEvaluate.class);
		return detailEvaluate;
	}

	@Autowired
	private DetailEvaluateRepository detailEvaluateRepository;

	@Override
	public List<DetailEvaluateDTO> getAllDetailEvaluate() {
		
		return detailEvaluateRepository.findAll().stream().map(this::convertIntoDto).collect(Collectors.toList());
	}

	@Override
	public DetailEvaluateDTO saveDetailEvaluate(DetailEvaluateDTO detailEvaluateDTO) {
		
		return convertIntoDto(detailEvaluateRepository.save(convertIntoEntity(detailEvaluateDTO)));
	}

	@Override
	public DetailEvaluateDTO getDetailEvaluate(Integer id) {
		
		return null;
	}

	@Override
	public DetailEvaluate updateDetailEvaluate(DetailEvaluate detailEvaluate) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteById(Integer id) {
		detailEvaluateRepository.deleteById(id);
		
	}
	
	

}
