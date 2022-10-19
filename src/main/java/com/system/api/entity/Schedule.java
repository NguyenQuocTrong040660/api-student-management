package com.system.api.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Schedule {

	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer id;
	
    //Subject
	@ManyToOne
	@JoinColumn(name = "subject_id",nullable = false)
	private Subject subject;
	
	
	//Dates
	@ManyToOne
	@JoinColumn(name = "date_id",nullable = false)
	private Dates dates;
	
	
	
	//Clazz
	@ManyToOne
	@JoinColumn(name = "clazz_id",nullable = false)
	private Clazz clazz;
	

	
	//EvalueSchedule
	@JsonIgnore
	@OneToMany(mappedBy = "schedule")
	private List<ScheduleEvaluate> scheduleEvaluates;
	
	
	@Column(columnDefinition = "nvarchar(200)")
	private String subjectContent;
	
	private Integer lession;
	
	private Integer lessionPPCT;
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	private Date dateStart;
	@Column(columnDefinition = "nvarchar(200)")
	private String note;
	
	private boolean status;
	
	private Integer idTeacher;
	@Column(columnDefinition = "nvarchar(200)")
	private String nameTeacher;
	

	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy")
	@Column(name = "create_at", nullable = false, updatable = false)
	private Date createTime;

	@UpdateTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy")
	@Column(name = "update_at")
	private Date updateTime;
	
	
	
	

	public Schedule() {
		super();
	}

	public Schedule(Integer id, Subject subject, Dates dates, Clazz clazz, String subjectContent, Integer lession,
			Integer lessionPPCT, Date dateStart, String note, boolean status, Integer idTeacher, String nameTeacher) {
		super();
		this.id = id;
		this.subject = subject;
		this.dates = dates;
		this.clazz = clazz;
		this.subjectContent = subjectContent;
		this.lession = lession;
		this.lessionPPCT = lessionPPCT;
		this.dateStart = dateStart;
		this.note = note;
		this.status = status;
		this.idTeacher = idTeacher;
		this.nameTeacher = nameTeacher;
	}
	
	public Schedule(Integer id, Subject subject, Dates dates,  Clazz clazz,
			List<ScheduleEvaluate> scheduleEvaluates, String subjectContent, Integer lession, Integer lessionPPCT,
			Date dateStart, String note, boolean status) {
		super();
		this.id = id;
		this.subject = subject;
		this.dates = dates;
		
		this.clazz = clazz;
		this.scheduleEvaluates = scheduleEvaluates;
		this.subjectContent = subjectContent;
		this.lession = lession;
		this.lessionPPCT = lessionPPCT;
		this.dateStart = dateStart;
		this.note = note;
		this.status = status;
	}





	public Schedule(Subject subject, Dates dates,  Clazz clazz,
			List<ScheduleEvaluate> scheduleEvaluates, String subjectContent, Integer lession, Integer lessionPPCT,
			Date dateStart, String note, boolean status) {
		super();
		this.subject = subject;
		this.dates = dates;
		
		this.clazz = clazz;
		this.scheduleEvaluates = scheduleEvaluates;
		this.subjectContent = subjectContent;
		this.lession = lession;
		this.lessionPPCT = lessionPPCT;
		this.dateStart = dateStart;
		this.note = note;
		this.status = status;
	}
	
	


	public Schedule(Subject subject, Dates dates, Clazz clazz, String subjectContent, Integer lession,
			Integer lessionPPCT, Date dateStart, String note, boolean status) {
		super();
		this.subject = subject;
		this.dates = dates;
		this.clazz = clazz;
		this.subjectContent = subjectContent;
		this.lession = lession;
		this.lessionPPCT = lessionPPCT;
		this.dateStart = dateStart;
		this.note = note;
		this.status = status;
	}
	
	


	public Schedule(Subject subject, Dates dates, Clazz clazz, String subjectContent, Integer lession,
			Integer lessionPPCT, Date dateStart, String note, boolean status, Integer idTeacher, String nameTeacher) {
		super();
		this.subject = subject;
		this.dates = dates;
		this.clazz = clazz;
		this.subjectContent = subjectContent;
		this.lession = lession;
		this.lessionPPCT = lessionPPCT;
		this.dateStart = dateStart;
		this.note = note;
		this.status = status;
		this.idTeacher = idTeacher;
		this.nameTeacher = nameTeacher;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public Subject getSubject() {
		return subject;
	}


	public void setSubject(Subject subject) {
		this.subject = subject;
	}


	public Dates getDates() {
		return dates;
	}


	public void setDates(Dates dates) {
		this.dates = dates;
	}



	public Clazz getClazz() {
		return clazz;
	}


	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}


	public List<ScheduleEvaluate> getScheduleEvaluates() {
		return scheduleEvaluates;
	}


	public void setScheduleEvaluates(List<ScheduleEvaluate> scheduleEvaluates) {
		this.scheduleEvaluates = scheduleEvaluates;
	}


	public String getSubjectContent() {
		return subjectContent;
	}


	public void setSubjectContent(String subjectContent) {
		this.subjectContent = subjectContent;
	}


	public Integer getLession() {
		return lession;
	}


	public void setLession(Integer lession) {
		this.lession = lession;
	}


	public Integer getLessionPPCT() {
		return lessionPPCT;
	}


	public void setLessionPPCT(Integer lessionPPCT) {
		this.lessionPPCT = lessionPPCT;
	}


	public Date getDateStart() {
		return dateStart;
	}


	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}


	public String getNote() {
		return note;
	}


	public void setNote(String note) {
		this.note = note;
	}


	public boolean isStatus() {
		return status;
	}


	public void setStatus(boolean status) {
		this.status = status;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Date getUpdateTime() {
		return updateTime;
	}


	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}


	public Integer getIdTeacher() {
		return idTeacher;
	}


	public void setIdTeacher(Integer idTeacher) {
		this.idTeacher = idTeacher;
	}


	public String getNameTeacher() {
		return nameTeacher;
	}


	public void setNameTeacher(String nameTeacher) {
		this.nameTeacher = nameTeacher;
	}   
	
	
	
	
	
	
	
	
}
