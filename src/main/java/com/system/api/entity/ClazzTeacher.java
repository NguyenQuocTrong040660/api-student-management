package com.system.api.entity;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

@Entity
public class ClazzTeacher {
	
	@EmbeddedId
    private CompositeKeyClazzTeacher id;
	
	@ManyToOne
    @MapsId("clazz_id")
    @JoinColumn(name = "clazz_id")
    private Clazz clazz;

    @ManyToOne
    @MapsId("teacher_id")
    @JoinColumn(name = "teacher_id")
    private Teacher teacher;
    
    @Column(columnDefinition = "nvarchar(100)")
    private String roleClazz;
    
	public ClazzTeacher() {
		super();
		
	}
    
	
	
	public ClazzTeacher(CompositeKeyClazzTeacher id, Clazz clazz, Teacher teacher) {
		super();
		this.id = id;
		this.clazz = clazz;
		this.teacher = teacher;
	}
	
	

	public ClazzTeacher( CompositeKeyClazzTeacher id,Clazz clazz, Teacher teacher, String roleClazz) {
		super();
		this.id = id;
		this.clazz = clazz;
		this.teacher = teacher;
		this.roleClazz = roleClazz;
	}



	public CompositeKeyClazzTeacher getId() {
		return id;
	}

	public void setId(CompositeKeyClazzTeacher id) {
		this.id = id;
	}

	public Clazz getClazz() {
		return clazz;
	}

	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}



	public String getRoleClazz() {
		return roleClazz;
	}



	public void setRoleClazz(String roleClazz) {
		this.roleClazz = roleClazz;
	}
	
	
    
    
	

}
