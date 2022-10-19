package com.system.api.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;


@Entity

public class Dates {
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	@Column(name = "date_id")
	private Integer id;
	
	@Column(name = "entry_Date")
	private Date entryDate;
	
	@Column(name = "week_year")
	private Integer week;
	
	
	private String nameDay;
	
	@JsonIgnore
	@OneToMany(mappedBy = "dates")
	private List<Schedule> schedules;


	public Dates() {
		super();
	}


	public Dates(Integer id, Date entryDate, Integer week) {
		super();
		this.id = id;
		this.entryDate = entryDate;
		this.week = week;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Date getEntryDate() {
		return entryDate;
	}


	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}


	public Integer getWeek() {
		return week;
	}


	public void setWeek(Integer week) {
		this.week = week;
	}


	public String getNameDay() {
		return nameDay;
	}


	public void setNameDay(String nameDay) {
		this.nameDay = nameDay;
	}


	public List<Schedule> getSchedules() {
		return schedules;
	}


	public void setSchedules(List<Schedule> schedules) {
		schedules = schedules;
	}
	
	


	
	
	
	

}
