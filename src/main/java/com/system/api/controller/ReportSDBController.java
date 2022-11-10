package com.system.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.model.ClazzDTO;
import com.system.api.repository.ScheduleRepository;
import com.system.api.response.ResponseReportSDB;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class ReportSDBController {
	
	@Autowired
	private  ScheduleRepository scheduleRepository;
	
	//get All
			@GetMapping("/get-all-sdb/{week}/{idClazz}")
			public List<ResponseReportSDB> getAllSDB(@PathVariable Integer week,@PathVariable Integer idClazz) {
				return scheduleRepository.responseReportSDB(week, idClazz);

			}
	

}
