package com.system.api.entity;

import java.util.Date;

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

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class DetailEvaluate {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private Integer student_id;
    
	@Column(columnDefinition = "nvarchar(200)")
	private String studentName;
	
	@ManyToOne
	@JoinColumn(name="scheduleEvaluate_id",nullable = false)
	private ScheduleEvaluate scheduleEvaluate;
	
	@ManyToOne
	@JoinColumn(name="offence_id",nullable = false)
	private Offence Offence;
	
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="create_at", nullable=false ,updatable=false)
	private Date createTime;
	
	@UpdateTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="update_at")
	private Date updateTime;

	public DetailEvaluate() {
		super();
	}

	public DetailEvaluate(Integer id, Integer student_id, String studentName, ScheduleEvaluate scheduleEvaluate,
			com.system.api.entity.Offence offence) {
		super();
		this.id = id;
		this.student_id = student_id;
		this.studentName = studentName;
		this.scheduleEvaluate = scheduleEvaluate;
		Offence = offence;
	}

	public DetailEvaluate(Integer student_id, String studentName, ScheduleEvaluate scheduleEvaluate,
			com.system.api.entity.Offence offence) {
		super();
		this.student_id = student_id;
		this.studentName = studentName;
		this.scheduleEvaluate = scheduleEvaluate;
		Offence = offence;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getStudent_id() {
		return student_id;
	}

	public void setStudent_id(Integer student_id) {
		this.student_id = student_id;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public ScheduleEvaluate getScheduleEvaluate() {
		return scheduleEvaluate;
	}

	public void setScheduleEvaluate(ScheduleEvaluate scheduleEvaluate) {
		this.scheduleEvaluate = scheduleEvaluate;
	}

	public Offence getOffence() {
		return Offence;
	}

	public void setOffence(Offence offence) {
		Offence = offence;
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
	
	
	
	
	

}
