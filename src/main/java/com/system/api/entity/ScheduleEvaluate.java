package com.system.api.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class ScheduleEvaluate {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(columnDefinition = "nvarchar(200)")
	private String evaluateNote;
	
	private Float mark1;
	
	private Float mark2;
	
	private Float mark3;
	
	@Column(columnDefinition = "nvarchar(200)")
	private String homeWork;
	
	@ManyToOne
	@JoinColumn(name="schedule_id",nullable = false)
	private Schedule schedule;
	
	
	@OneToMany(mappedBy = "scheduleEvaluate")
    private List<DetailEvaluate> detailEvaluates;


	public ScheduleEvaluate() {
		super();
	}


	public ScheduleEvaluate(Integer id, String evaluateNote, Float mark1, Float mark2, Float mark3, String homeWork,
			Schedule schedule) {
		super();
		this.id = id;
		this.evaluateNote = evaluateNote;
		this.mark1 = mark1;
		this.mark2 = mark2;
		this.mark3 = mark3;
		this.homeWork = homeWork;
		this.schedule = schedule;
		
	}


	public ScheduleEvaluate(String evaluateNote, Float mark1, Float mark2, Float mark3, String homeWork,
			Schedule schedule, List<DetailEvaluate> detailEvaluates) {
		super();
		this.evaluateNote = evaluateNote;
		this.mark1 = mark1;
		this.mark2 = mark2;
		this.mark3 = mark3;
		this.homeWork = homeWork;
		this.schedule = schedule;
		this.detailEvaluates = detailEvaluates;
	}


	public ScheduleEvaluate(String evaluateNote, Float mark1, Float mark2, Float mark3, String homeWork,
			Schedule schedule) {
		super();
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


	public Schedule getSchedule() {
		return schedule;
	}


	public void setSchedule(Schedule schedule) {
		this.schedule = schedule;
	}


	public List<DetailEvaluate> getDetailEvaluates() {
		return detailEvaluates;
	}


	public void setDetailEvaluates(List<DetailEvaluate> detailEvaluates) {
		this.detailEvaluates = detailEvaluates;
	}
	
	
	
	
	
	
	

}
