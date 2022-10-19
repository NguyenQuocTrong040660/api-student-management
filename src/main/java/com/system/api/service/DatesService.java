package com.system.api.service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.system.api.entity.Dates;
import com.system.api.model.DatesDTO;
import com.system.api.response.DateResponseByWeek;
import com.system.api.response.checkVPByWeek;
import com.system.api.response.joinCheckvpAndDate;

public interface DatesService {
	
	// get ds Dates
		List<DatesDTO> getAllDates();

		// get 1 entity(Dates) thong qua id
		Optional<Dates> getDates(Integer id);
		
		//=>CheckVP=>Get data from some tabe
		List<checkVPByWeek> jointableCheckVP(Integer week);
		
		//=>CheckVP
		Dates getDateByNowDate(String entryDate);
		
		//=>Lecture
		List<DateResponseByWeek> getWeeks();
		
		//=>Lecture
		List<DatesDTO> getAllDateByWeek(Integer week);

	

}
