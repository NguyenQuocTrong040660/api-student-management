package com.system.api.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class DetailEvaluateDTO {

	private Integer id;

	private Integer student_id;

	private String studentName;

	private ScheduleEvaluateDTO scheduleEvaluate;

	private OffenceDTO offence;

	private Date createTime;

	private Date updateTime;

	public DetailEvaluateDTO() {
		super();
	}

	public DetailEvaluateDTO(Integer student_id, String studentName, ScheduleEvaluateDTO scheduleEvaluate,
			OffenceDTO offence) {
		super();
		this.student_id = student_id;
		this.studentName = studentName;
		this.scheduleEvaluate = scheduleEvaluate;
		this.offence = offence;
	}

	public DetailEvaluateDTO(Integer id, Integer student_id, String studentName, ScheduleEvaluateDTO scheduleEvaluate,
			OffenceDTO offence) {
		super();
		this.id = id;
		this.student_id = student_id;
		this.studentName = studentName;
		this.scheduleEvaluate = scheduleEvaluate;
		this.offence = offence;
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

	public ScheduleEvaluateDTO getScheduleEvaluate() {
		return scheduleEvaluate;
	}

	public void setScheduleEvaluate(ScheduleEvaluateDTO scheduleEvaluate) {
		this.scheduleEvaluate = scheduleEvaluate;
	}

	public OffenceDTO getOffence() {
		return offence;
	}

	public void setOffence(OffenceDTO offence) {
		this.offence = offence;
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
