package com.system.api.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Entity
public class MarkType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(columnDefinition = "nvarchar(200)")
	private String markTypeName;
	
	private float markNumber;
	
	@OneToMany(mappedBy = "markType")
	private List<Mark> marks;
	
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy")
	@Column(name = "create_at", nullable = false, updatable = false)
	private Date createTime;

	@UpdateTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy")
	@Column(name = "update_at")
	private Date updateTime;

	public MarkType() {
		super();
	}

	
	
	public MarkType(String markTypeName, float markNumber) {
		super();
		this.markTypeName = markTypeName;
		this.markNumber = markNumber;
	}

   

	public MarkType(Integer id, String markTypeName, float markNumber) {
		super();
		this.id = id;
		this.markTypeName = markTypeName;
		this.markNumber = markNumber;
	}



	public MarkType(String markTypeName, List<Mark> marks, Date createTime) {
		super();
		this.markTypeName = markTypeName;
		this.marks = marks;
		this.createTime = createTime;
	}


	public MarkType(Integer id, String markTypeName, List<Mark> marks) {
		super();
		this.id = id;
		this.markTypeName = markTypeName;
		this.marks = marks;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getMarkTypeName() {
		return markTypeName;
	}



	public void setMarkTypeName(String markTypeName) {
		this.markTypeName = markTypeName;
	}



	public float getMarkNumber() {
		return markNumber;
	}



	public void setMarkNumber(float markNumber) {
		this.markNumber = markNumber;
	}



	public List<Mark> getMarks() {
		return marks;
	}



	public void setMarks(List<Mark> marks) {
		this.marks = marks;
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
