package com.system.api.response;

import java.util.Date;

import lombok.Data;
import lombok.Value;

@Data
public class joinCheckvpAndDate {
	
	private Integer id;
	
	private Date entryDate;
	
	private Integer week;
	
	private String nameDay;

	
	public joinCheckvpAndDate(Integer id, Date entryDate, Integer week, String nameDay) {
		super();
		this.id = id;
		this.entryDate = entryDate;
		this.week = week;
		this.nameDay = nameDay;
	}

	public Integer getId() {
		return id;
	}


	public Date getEntryDate() {
		return entryDate;
	}

	public Integer getWeek() {
		return week;
	}


	public String getNameDay() {
		return nameDay;
	}

	


	
	
	
	
	
	

}
