package com.system.api.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class CompositeKeyClazzTeacher implements Serializable {
	
	@Column(name = "clazz_id")
    Integer clazzId;

    @Column(name = "teacher_id")
    Integer teacherId;

	public Integer getClazzId() {
		return clazzId;
	}

	public void setClazzId(Integer clazzId) {
		this.clazzId = clazzId;
	}

	public Integer getTeacherId() {
		return teacherId;
	}

	public void setTeacherID(Integer teacherId) {
		this.teacherId = teacherId;
	}
	
	

	public CompositeKeyClazzTeacher() {
		super();
	}

	public CompositeKeyClazzTeacher(Integer clazzId, Integer teacherId) {
		super();
		this.clazzId = clazzId;
		this.teacherId = teacherId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(clazzId, teacherId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CompositeKeyClazzTeacher other = (CompositeKeyClazzTeacher) obj;
		return Objects.equals(clazzId, other.clazzId) && Objects.equals(teacherId, other.teacherId);
	}
	
	
    
    

}
