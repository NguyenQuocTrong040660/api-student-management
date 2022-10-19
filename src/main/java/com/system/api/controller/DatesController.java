package com.system.api.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.hibernate.annotations.Parameter;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.Dates;
import com.system.api.entity.Offence;
import com.system.api.model.DatesDTO;
import com.system.api.model.OffenceDTO;
import com.system.api.response.DateResponseByWeek;
import com.system.api.response.checkVPByWeek;
import com.system.api.response.joinCheckvpAndDate;
import com.system.api.service.DatesService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class DatesController {
	
	
	

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private DatesService datesService;
	
	
	public DatesDTO convertIntoDto(Dates dates) {

		DatesDTO datesDTO = modelMapper.map(dates, DatesDTO.class);
		return datesDTO;
	}

	public Dates convertIntoEntity(DatesDTO datesDTO) {
		Dates dates = modelMapper.map(datesDTO, Dates.class);
		return dates;
	}
	


	// Get All
	@GetMapping("/dates")
	public List<DatesDTO> getAllDates() {

		return datesService.getAllDates();

	}
	
	
	// Create
	  
		@GetMapping("/dates/{id}")
		public ResponseEntity<DatesDTO> getOffenceById(@PathVariable Integer id) {

			Optional<Dates> datesOptional = datesService.getDates(id);
			return datesOptional.map(dates -> new ResponseEntity<>(convertIntoDto(dates), HttpStatus.OK))
					.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
		}
		// Get 
		@GetMapping("/dates-checkVP/{week}")
		public List<checkVPByWeek> jointableCheckVP(@PathVariable Integer week) {

			return datesService.jointableCheckVP(week);

		}
		
		//Get Date By Now date
		
		@PostMapping("/get-date-by-now-date")
		public ResponseEntity<DatesDTO> getDateByNowDate( @RequestParam String date) {
			System.out.println(date);

			Dates datesRs = datesService.getDateByNowDate(date);
			if(datesRs!=null) {
				return new ResponseEntity<>(convertIntoDto(datesRs), HttpStatus.OK);
			}
			else  {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
		}
		
		//get all Week in year to Lecture shedule
		@PostMapping("/dates/weeks")
		public List<DateResponseByWeek> weeks() {

			return datesService.getWeeks();

		}
		
		
		//Lecture => GetDates from week
		@PostMapping("/dates-from-week/{week}")
		public List<DatesDTO> getDatesFromWeek(@PathVariable Integer week) {

			return datesService.getAllDateByWeek(week);

		}
		
		
		
		
		
	
	
	

}
