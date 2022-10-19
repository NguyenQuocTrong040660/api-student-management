package com.system.api.model;

import javax.persistence.Column;

public class CompositeKeyClazzTeacherDTO {

	 Integer clazzId;
	 
     Integer teacherId;
     
     
	public CompositeKeyClazzTeacherDTO() {
		super();
	}


	public CompositeKeyClazzTeacherDTO(Integer clazzId, Integer teacherId) {
		super();
		this.clazzId = clazzId;
		this.teacherId = teacherId;
	}


	public Integer getClazzId() {
		return clazzId;
	}


	public void setClazzId(Integer clazzId) {
		this.clazzId = clazzId;
	}


	public Integer getTeacherId() {
		return teacherId;
	}


	public void setTeacherId(Integer teacherId) {
		this.teacherId = teacherId;
	}


	@Override
	public String toString() {
		return "CompositeKeyClazzTeacherDTO [clazzId=" + clazzId + ", teacherId=" + teacherId + "]";
	}
	
	
	
     
     
}
