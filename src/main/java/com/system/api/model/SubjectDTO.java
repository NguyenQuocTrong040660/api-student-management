package com.system.api.model;

import java.util.List;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



public class SubjectDTO {
	
	private Integer id;
	
	@NotBlank
	private String subjectName;
	
	private boolean subjectStatus;
	
	@JsonIgnore
	private List<ScheduleDTO> schedules;
	
	public SubjectDTO() {
		super();
	}

	public SubjectDTO(String subjectName, boolean subjectStatus) {
		super();
		this.subjectName = subjectName;
		this.subjectStatus = subjectStatus;
	}
	
	
	public SubjectDTO(Integer id, String subjectName, boolean subjectStatus) {
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

	public List<ScheduleDTO> getSchedules() {
		return schedules;
	}

	public void setSchedules(List<ScheduleDTO> schedules) {
		schedules = schedules;
	}
	
	

	
	
}
