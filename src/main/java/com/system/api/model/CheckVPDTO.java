package com.system.api.model;

import java.util.Date;

import javax.validation.constraints.NotBlank;


public class CheckVPDTO {

	private Integer id;
	
	
	private Integer offenceId;
	
    private Integer offenceMark;
	
   
	private Integer dateId;
	
	private StudentDTO student;
	
	private boolean status;
	
	private Date createTime;
	
	private Date updateTime;

	public CheckVPDTO() {
		super();
	}
	
	

	public CheckVPDTO(Integer offenceId, Integer offenceMark, Integer dateId, StudentDTO student, boolean status) {
		super();
		this.offenceId = offenceId;
		this.offenceMark = offenceMark;
		this.dateId = dateId;
		this.student = student;
		this.status = status;
	}



	public CheckVPDTO(Integer offenceId, StudentDTO student, boolean status) {
		super();
		this.offenceId = offenceId;
		this.student = student;
		this.status = status;
	}

	public CheckVPDTO(Integer id, Integer offenceId, StudentDTO student, boolean status) {
		super();
		this.id = id;
		this.offenceId = offenceId;
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

	public StudentDTO getStudent() {
		return student;
	}

	public void setStudent(StudentDTO student) {
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
