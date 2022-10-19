 package com.system.api.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ScheduleEvaluateDTO {
	
	private Integer id;
	
	private String evaluateNote;
	
	private Float mark1;
	
	private Float mark2;
	
	private Float mark3;
	
	private String homeWork;
	
	
	private ScheduleDTO schedule;
	
	@JsonIgnore
    private List<DetailEvaluateDTO> detailEvaluates;
	
	

	public ScheduleEvaluateDTO() {
		super();
	}
	
	

	public ScheduleEvaluateDTO(String evaluateNote, Float mark1, Float mark2, Float mark3, String homeWork,
			ScheduleDTO schedule) {
		super();
		this.evaluateNote = evaluateNote;
		this.mark1 = mark1;
		this.mark2 = mark2;
		this.mark3 = mark3;
		this.homeWork = homeWork;
		this.schedule = schedule;
	}


	public ScheduleEvaluateDTO(Integer id, String evaluateNote, Float mark1, Float mark2, Float mark3, String homeWork,
			ScheduleDTO schedule) {
		super();
		this.id = id;
		this.evaluateNote = evaluateNote;
		this.mark1 = mark1;
		this.mark2 = mark2;
		this.mark3 = mark3;
		this.homeWork = homeWork;
		this.schedule = schedule;
		
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEvaluateNote() {
		return evaluateNote;
	}

	public void setEvaluateNote(String evaluateNote) {
		this.evaluateNote = evaluateNote;
	}

	public Float getMark1() {
		return mark1;
	}

	public void setMark1(Float mark1) {
		this.mark1 = mark1;
	}

	public Float getMark2() {
		return mark2;
	}

	public void setMark2(Float mark2) {
		this.mark2 = mark2;
	}

	public Float getMark3() {
		return mark3;
	}

	public void setMark3(Float mark3) {
		this.mark3 = mark3;
	}

	public String getHomeWork() {
		return homeWork;
	}

	public void setHomeWork(String homeWork) {
		this.homeWork = homeWork;
	}

	public ScheduleDTO getSchedule() {
		return schedule;
	}

	public void setSchedule(ScheduleDTO schedule) {
		this.schedule = schedule;
	}

	public List<DetailEvaluateDTO> getDetailEvaluates() {
		return detailEvaluates;
	}

	public void setDetailEvaluates(List<DetailEvaluateDTO> detailEvaluates) {
		this.detailEvaluates = detailEvaluates;
	}
    
    
    
    
}
