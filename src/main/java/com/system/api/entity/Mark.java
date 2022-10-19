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

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class Mark {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private Integer subjectId;

	private Float mark;
	
	private Integer semester;
	
	//relationship with class Schedule => convert Student
	@ManyToOne
	@JoinColumn(name = "student_id",nullable = false)
	private Student student;
	
	//MarkType
	@ManyToOne
	@JoinColumn(name = "markType_id",nullable = false)
	private MarkType markType;
	
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="create_at", nullable=false ,updatable=false)
	private Date createTime;
	
	@UpdateTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="update_at")
	private Date updateTime;
	
	private boolean status;


	public Mark() {
		super();
	}


	public Mark(Integer subjectId, Float mark, Integer semester, Student student, MarkType markType, boolean status) {
		super();
		this.subjectId = subjectId;
		this.mark = mark;
		this.semester = semester;
		this.student = student;
		this.markType = markType;
		this.status = status;
	}


	public Mark(Integer id, Integer subjectId, Float mark, Integer semester, Student student, MarkType markType,
			boolean status) {
		super();
		this.id = id;
		this.subjectId = subjectId;
		this.mark = mark;
		this.semester = semester;
		this.student = student;
		this.markType = markType;
		this.status = status;
	}


	public Mark(Integer id, Integer subjectId, Float mark, Integer semester, Student student, MarkType markType,
			Date createTime, Date updateTime, boolean status) {
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


	public Student getStudent() {
		return student;
	}


	public void setStudent(Student student) {
		this.student = student;
	}


	public MarkType getMarkType() {
		return markType;
	}


	public void setMarkType(MarkType markType) {
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
