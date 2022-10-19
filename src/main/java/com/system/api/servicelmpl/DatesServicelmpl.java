package com.system.api.servicelmpl;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.Dates;
import com.system.api.entity.Offence;
import com.system.api.model.DatesDTO;
import com.system.api.model.OffenceDTO;
import com.system.api.repository.DatesRepository;
import com.system.api.response.DateResponseByWeek;
import com.system.api.response.checkVPByWeek;
import com.system.api.response.joinCheckvpAndDate;
import com.system.api.service.DatesService;


@Service
public class DatesServicelmpl implements DatesService {

	@Autowired
	private DatesRepository datesRepository;
	
	
	@Autowired
	private ModelMapper modelMapper;
	
	
	public DatesDTO convertIntoDto(Dates dates) {
		
		DatesDTO datesDTO = modelMapper.map(dates, DatesDTO.class);
        return datesDTO;
    }
    
    public Dates convertIntoEntity(DatesDTO datesDTO) {
    	Dates dates = modelMapper.map(datesDTO, Dates.class);
        return dates;
    }
	
	@Override
	public List<DatesDTO> getAllDates() {
		
		return datesRepository.findAll().stream().map(this::convertIntoDto).collect(Collectors.toList());
	}

	

	@Override
	public Optional<Dates> getDates(Integer id) {
		return datesRepository.findById(id);
	}

	//=>Excel =>CheckVP
	@Override
	public List<checkVPByWeek> jointableCheckVP(Integer week) {
		
		return datesRepository.checkVPByWeekYear(week);
	}
	
	//=>Check VP
	@Override
	public Dates getDateByNowDate(String entryDate) {
		 return datesRepository.findByEntryDate(entryDate);
	}

	//=>Lecture
	@Override
	public List<DateResponseByWeek> getWeeks() {
		
		return datesRepository.findDistinctByWeek();
	}

	//=>Lecture
	@Override
	public List<DatesDTO> getAllDateByWeek(Integer week) {
		
		return datesRepository.findByWeek(week).stream().map(this::convertIntoDto).collect(Collectors.toList());
	}

}
