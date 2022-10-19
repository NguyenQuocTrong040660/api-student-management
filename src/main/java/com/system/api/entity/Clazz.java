package com.system.api.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class Clazz {
	
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer id;
	
	@Column(columnDefinition = "nvarchar(100)",unique = true)
	private String nameClazz;
	
	private Date startDate;
	
	private Date endDate;
	
	private boolean status;
	
	//relation with student
	
	@JsonIgnore
	@OneToMany(mappedBy = "clazz",cascade = CascadeType.ALL)
	private List<Student> students;
	
	//relation with ClazzTeacher
	@JsonIgnore
	@OneToMany(mappedBy = "clazz",cascade = CascadeType.ALL)
	private List<ClazzTeacher> clazzTeacher;
	
	
	//relation with Schedule
	@JsonIgnore
	@OneToMany(mappedBy = "clazz",cascade = CascadeType.ALL)
	private List<Schedule> schedules;
	
	
	
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="create_at", nullable=false ,updatable=false)
	private Date createTime;
	
	@UpdateTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="update_at")
	private Date updateTime;

	public Clazz() {
		super();
	}

	public Clazz(String nameClazz, Date startDate, Date endDate, boolean status, List<Student> students,
			 List<Schedule> schedules) {
		super();
		this.nameClazz = nameClazz;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.students = students;
		
		this.schedules = schedules;
	}
	
	
	


	public Clazz(String nameClazz, Date startDate, Date endDate, boolean status, List<Student> students,
			List<Schedule> schedules,  List<ClazzTeacher> clazzTeacher) {
		super();
		this.nameClazz = nameClazz;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		this.students = students;
		this.schedules = schedules;
		this.clazzTeacher = clazzTeacher;
	}

	public Clazz( String nameClazz, Date startDate, Date endDate, boolean status, Teacher teacher) {
		super();
		
		this.nameClazz = nameClazz;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
		
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

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	

	public List<Schedule> getSchedules() {
		return schedules;
	}

	public void setSchedules(List<Schedule> schedules) {
		this.schedules = schedules;
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

	public List<ClazzTeacher> getClazzTeacher() {
		return clazzTeacher;
	}

	public void setClazzTeacher(List<ClazzTeacher> clazzTeacher) {
		this.clazzTeacher = clazzTeacher;
	}

	

	
	
	
	
	
	
	
	
	
	

}
