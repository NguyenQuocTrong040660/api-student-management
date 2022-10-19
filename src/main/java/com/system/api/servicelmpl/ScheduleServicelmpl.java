package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.system.api.entity.Schedule;
import com.system.api.entity.Student;
import com.system.api.model.ScheduleDTO;
import com.system.api.model.StudentDTO;
import com.system.api.repository.ScheduleRepository;
import com.system.api.service.ScheduleService;

@Service
public class ScheduleServicelmpl implements ScheduleService {
	@Autowired
	private ModelMapper modelMapper;

    //convert Entity => DTO
	public ScheduleDTO convertIntoDto(Schedule schedule) {

		ScheduleDTO scheduleDTO = modelMapper.map(schedule, ScheduleDTO.class);
		return scheduleDTO;
	}

	//convert DTO => Entity
	public Schedule convertIntoEntity(ScheduleDTO scheduleDTO) {
		Schedule student = modelMapper.map(scheduleDTO, Schedule.class);
		return student;
	}

	@Autowired
	private ScheduleRepository scheduleRepository;
	
	
	@Override
	public List<ScheduleDTO> getAllSchedule() {
		
		return scheduleRepository.findAllByOrderByDateStartAscLessionAsc().stream().map(this::convertIntoDto).collect(Collectors.toList());
	}

	@Override
	public ScheduleDTO saveSchedule(ScheduleDTO schedule) {
		
		return convertIntoDto(scheduleRepository.save(convertIntoEntity(schedule)));
	}

	@Override
	public Optional<Schedule> getSchedule(Integer id) {
		return  scheduleRepository.findById(id);
		
	}
	

	@Override
	public ScheduleDTO updateSchedule(ScheduleDTO scheduleDTO) {
		
		return convertIntoDto(scheduleRepository.save(convertIntoEntity(scheduleDTO)));
	}

	@Override
	public void deleteById(Integer id) {
		scheduleRepository.deleteById(id);

	}

	@Override
	public List<ScheduleDTO> getSchedulesByDatesWeek(Integer id) {
		
		return scheduleRepository.findByDatesWeekOrderByDateStartAscLessionAsc(id).stream().map(this::convertIntoDto).collect(Collectors.toList());
	}

}
