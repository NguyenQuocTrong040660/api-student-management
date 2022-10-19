package com.system.api.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;


@Setter
@Getter
@Entity
public class Subject {
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer id;
	
	@Column(columnDefinition = "nvarchar(200)")
	private String subjectName;
	
	
	private boolean subjectStatus;
	
	
	@OneToMany(mappedBy = "subject")
	private List<Schedule> schedules;
	
	

	public Subject() {
		super();
	}

	
	public Subject(String subjectName, boolean subjectStatus) {
		super();
		this.subjectName = subjectName;
		this.subjectStatus = subjectStatus;
	}


	public Subject(Integer id, String subjectName, boolean subjectStatus, List<Schedule> schedules) {
		super();
		this.id = id;
		this.subjectName = subjectName;
		this.subjectStatus = subjectStatus;
		schedules = schedules;
	}
	
	


	public Subject(Integer id, String subjectName, boolean subjectStatus) {
		super();
		this.id = id;
		this.subjectName = subjectName;
		this.subjectStatus = subjectStatus;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getSubjectName() {
		return subjectName;
	}


	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}


	public boolean isSubjectStatus() {
		return subjectStatus;
	}


	public void setSubjectStatus(boolean subjectStatus) {
		this.subjectStatus = subjectStatus;
	}


	public List<Schedule> getSchedules() {
		return schedules;
	}


	public void setSchedules(List<Schedule> schedules) {
		schedules = schedules;
	}



	
	
	
	

}
