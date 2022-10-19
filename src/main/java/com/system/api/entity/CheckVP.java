package com.system.api.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Entity
public class CheckVP {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Integer offenceId;
	private Integer offenceMark;
	
	private Integer dateId;
	
	
	//relationship with class Schedule
	@ManyToOne
	@JoinColumn(name = "student_id",nullable = false)
	private Student student;
	
	private boolean status;
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="create_at", nullable=false ,updatable=false)
	private Date createTime;
	
	@UpdateTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="update_at")
	private Date updateTime;

	
	public CheckVP() {
		super();
	}

	public CheckVP(Integer offenceId, Student student, boolean status) {
		super();
		this.offenceId = offenceId;
		this.student = student;
		this.status = status;
	}
	
	

	public CheckVP(Integer offenceId, Integer offenceMark, Integer dateId, Student student, boolean status) {
		super();
		this.offenceId = offenceId;
		this.offenceMark = offenceMark;
		this.dateId = dateId;
		this.student = student;
		this.status = status;
	}




	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getOffenceId() {
		return offenceId;
	}

	public void setOffenceId(Integer offenceId) {
		this.offenceId = offenceId;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
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

	public Integer getOffenceMark() {
		return offenceMark;
	}

	public void setOffenceMark(Integer offenceMark) {
		this.offenceMark = offenceMark;
	}

	public Integer getDateId() {
		return dateId;
	}

	public void setDateId(Integer dateId) {
		this.dateId = dateId;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
