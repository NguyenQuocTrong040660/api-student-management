package com.system.api.model;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class ScheduleDTO {

	
	private Integer id;
	
	private SubjectDTO subject;
	
	private DatesDTO dates;
	
	
	private ClazzDTO clazz;
	
	@JsonIgnore
	private List<ScheduleEvaluateDTO> scheduleEvaluates;
	
	private String subjectContent;
	
	private Integer lession;
	
	private Integer lessionPPCT;

	private Date dateStart;
	
	private String note;
	
	private boolean status;
	
	@NotBlank
	private Integer idTeacher;
	
	private String nameTeacher;
	
	public ScheduleDTO() {
		super();
	}
	
	
	public ScheduleDTO(SubjectDTO subject, DatesDTO dates, ClazzDTO clazz, String subjectContent, Integer lession,
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
	
	

	public ScheduleDTO(SubjectDTO subject, DatesDTO dates, ClazzDTO clazz, String subjectContent, Integer lession,
			Integer lessionPPCT, Date dateStart, String note, boolean status,  Integer idTeacher,
			String nameTeacher) {
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
	
	


	public ScheduleDTO(Integer id, SubjectDTO subject, DatesDTO dates, ClazzDTO clazz, String subjectContent,
			Integer lession, Integer lessionPPCT, Date dateStart, String note, boolean status,
			 Integer idTeacher, String nameTeacher) {
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


	public ScheduleDTO(Integer id, SubjectDTO subject, DatesDTO dates, ClazzDTO clazz,
			List<ScheduleEvaluateDTO> scheduleEvaluates, String subjectContent, Integer lession, Integer lessionPPCT,
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



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public SubjectDTO getSubject() {
		return subject;
	}

	public void setSubject(SubjectDTO subject) {
		this.subject = subject;
	}

	public DatesDTO getDates() {
		return dates;
	}

	public void setDates(DatesDTO dates) {
		this.dates = dates;
	}


	public ClazzDTO getClazz() {
		return clazz;
	}

	public void setClazz(ClazzDTO clazz) {
		this.clazz = clazz;
	}

	public List<ScheduleEvaluateDTO> getScheduleEvaluates() {
		return scheduleEvaluates;
	}

	public void setScheduleEvaluates(List<ScheduleEvaluateDTO> scheduleEvaluates) {
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
