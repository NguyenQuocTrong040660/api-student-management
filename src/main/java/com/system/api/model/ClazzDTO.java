package com.system.api.model;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.system.api.entity.ClazzTeacher;
import com.system.api.entity.Schedule;
import com.system.api.entity.Student;
import com.system.api.entity.Teacher;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ClazzDTO {

	private Integer id;

	private String nameClazz;

	private Date startDate;

	private Date endDate;

	private boolean status;

	@JsonIgnore
	private List<StudentDTO> students;
    
	
	@JsonIgnore
	private List<ScheduleDTO> schedules;
	
	@JsonIgnore
	private List<ClazzTeacherDTO> clazzTeacher;
	
	

	public ClazzDTO() {
		super();
	}
	
	

	public ClazzDTO( String nameClazz, Date startDate, Date endDate, boolean status,
			List<StudentDTO> students, List<ScheduleDTO> schedules, List<ClazzTeacherDTO> clazzTeacher) {
		super();
		
		this.nameClazz = nameClazz;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.students = students;
		this.schedules = schedules;
		this.clazzTeacher = clazzTeacher;
	}






	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNameClazz() {
		return nameClazz;
	}

	public void setNameClazz(String nameClazz) {
		this.nameClazz = nameClazz;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public List<StudentDTO> getStudents() {
		return students;
	}

	public void setStudents(List<StudentDTO> students) {
		this.students = students;
	}

	public List<ClazzTeacherDTO> getClazzTeacher() {
		return clazzTeacher;
	}



	public void setClazzTeacher(List<ClazzTeacherDTO> clazzTeacher) {
		this.clazzTeacher = clazzTeacher;
	}



	public List<ScheduleDTO> getSchedules() {
		return schedules;
	}

	public void setSchedules(List<ScheduleDTO> schedules) {
		this.schedules = schedules;
	}

	

	
	
	

}
