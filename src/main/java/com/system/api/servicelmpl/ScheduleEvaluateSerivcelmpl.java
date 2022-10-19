package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.ScheduleEvaluate;
import com.system.api.model.ScheduleEvaluateDTO;
import com.system.api.repository.ScheduleEvaluateRepository;
import com.system.api.service.ScheduleEvaluateService;

@Service
public class ScheduleEvaluateSerivcelmpl implements ScheduleEvaluateService {

	@Autowired
	private ModelMapper modelMapper;

	// convert Entity => DTO
	public ScheduleEvaluateDTO convertIntoDto(ScheduleEvaluate scheduleEvalue) {

		ScheduleEvaluateDTO scheduleEvaluateDTO = modelMapper.map(scheduleEvalue, ScheduleEvaluateDTO.class);
		return scheduleEvaluateDTO;
	}

	// convert DTO => Entity
	public ScheduleEvaluate convertIntoEntity(ScheduleEvaluateDTO scheduleEvalueDTO) {
		ScheduleEvaluate scheduleEvaluate = modelMapper.map(scheduleEvalueDTO, ScheduleEvaluate.class);
		return scheduleEvaluate;
	}

	@Autowired
	private ScheduleEvaluateRepository scheduleEvaluateRepository;

	@Override
	public List<ScheduleEvaluateDTO> getAllScheduleEvaluate() {
		
		return scheduleEvaluateRepository.findAll().stream().map(this::convertIntoDto).collect(Collectors.toList());
	}

	@Override
	public ScheduleEvaluateDTO saveScheduleEvaluate(ScheduleEvaluateDTO scheduleEvaluateDTO) {
		
		return convertIntoDto(scheduleEvaluateRepository.save(convertIntoEntity(scheduleEvaluateDTO)));
	}

	@Override
	public Optional<ScheduleEvaluate> getScheduleEvaluate(Integer id) {
		
		return scheduleEvaluateRepository.findById(id);
	}

	@Override
	public ScheduleEvaluateDTO updateScheduleEvaluate(ScheduleEvaluateDTO scheduleEvaluateDTO) {
		
		return convertIntoDto(scheduleEvaluateRepository.save(convertIntoEntity(scheduleEvaluateDTO)));
	}

	@Override
	public void deleteById(Integer id) {
		// TODO Auto-generated method stub
		
	}

	//Get Entity By Id of Schedule
	@Override
	public  Optional<ScheduleEvaluate> findByScheduleId(Integer id) {
		
		return scheduleEvaluateRepository.findByScheduleId(id);
	}

	

}
