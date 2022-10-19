package com.system.api.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.system.api.entity.MarkType;
import com.system.api.entity.Schedule;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MarkDTO {

	private Integer id;

	private Integer subjectId;

	private Float mark;

	private Integer semester;
	
	private StudentDTO student;

	private MarkTypeDTO markType;
	
	private Date createTime;
	
	private Date updateTime;

	private boolean status;

	public MarkDTO() {
		super();
	}

	public MarkDTO(Integer subjectId, Float mark, Integer semester, StudentDTO student, MarkTypeDTO markType,
			boolean status) {
		super();
		this.subjectId = subjectId;
		this.mark = mark;
		this.semester = semester;
		this.student = student;
		this.markType = markType;
		this.status = status;
	}

	public MarkDTO(Integer id, Integer subjectId, Float mark, Integer semester, StudentDTO student,
			MarkTypeDTO markType, boolean status) {
		super();
		this.id = id;
		this.subjectId = subjectId;
		this.mark = mark;
		this.semester = semester;
		this.student = student;
		this.markType = markType;
		this.status = status;
	}

	public MarkDTO(Integer subjectId, Float mark, Integer semester, StudentDTO student, MarkTypeDTO markType,
			Date createTime, Date updateTime, boolean status) {
		super();
		this.subjectId = subjectId;
		this.mark = mark;
		this.semester = semester;
		this.student = student;
		this.markType = markType;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.status = status;
	}

	public MarkDTO(Integer id, Integer subjectId, Float mark, Integer semester, StudentDTO student,
			MarkTypeDTO markType, Date createTime, Date updateTime, boolean status) {
		super();
		this.id = id;
		this.subjectId = subjectId;
		this.mark = mark;
		this.semester = semester;
		this.student = student;
		this.markType = markType;
		this.createTime = createTime;
		this.updateTime = updateTime;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Integer subjectId) {
		this.subjectId = subjectId;
	}

	public Float getMark() {
		return mark;
	}

	public void setMark(Float mark) {
		this.mark = mark;
	}

	public Integer getSemester() {
		return semester;
	}

	public void setSemester(Integer semester) {
		this.semester = semester;
	}

	public StudentDTO getStudent() {
		return student;
	}

	public void setStudent(StudentDTO student) {
		this.student = student;
	}

	public MarkTypeDTO getMarkType() {
		return markType;
	}

	public void setMarkType(MarkTypeDTO markType) {
		this.markType = markType;
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

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
}
