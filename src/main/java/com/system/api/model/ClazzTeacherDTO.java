package com.system.api.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class ClazzTeacherDTO {
	
    private CompositeKeyClazzTeacherDTO id;
	
    private ClazzDTO clazz;
    
    @JsonIgnore
    private TeacherDTO teacher;

    private String roleClazz;
    
	public ClazzTeacherDTO() {
		super();
	}


	public ClazzTeacherDTO(CompositeKeyClazzTeacherDTO id, ClazzDTO clazz, TeacherDTO teacher) {
		super();
		this.id = id;
		this.clazz = clazz;
		this.teacher = teacher;
	}
	
	


	public ClazzTeacherDTO(CompositeKeyClazzTeacherDTO id, ClazzDTO clazz, TeacherDTO teacher, String roleClazz) {
		super();
		this.id = id;
		this.clazz = clazz;
		this.teacher = teacher;
		this.roleClazz = roleClazz;
	}


	public CompositeKeyClazzTeacherDTO getId() {
		return id;
	}


	public void setId(CompositeKeyClazzTeacherDTO id) {
		this.id = id;
	}


	public ClazzDTO getClazz() {
		return clazz;
	}


	public void setClazz(ClazzDTO clazz) {
		this.clazz = clazz;
	}


	public TeacherDTO getTeacher() {
		return teacher;
	}


	public void setTeacher(TeacherDTO teacher) {
		this.teacher = teacher;
	}


	public String getRoleClazz() {
		return roleClazz;
	}


	public void setRoleClazz(String roleClazz) {
		this.roleClazz = roleClazz;
	}
	
	
	
	
    
    
    

}
