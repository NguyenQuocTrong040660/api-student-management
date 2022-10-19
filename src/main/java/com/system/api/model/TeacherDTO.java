package com.system.api.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.system.api.entity.ClazzTeacher;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class TeacherDTO {
	
	
	private Integer id;

	private String teacherName;

	private Date birthDate;

	private boolean gender;

	private String address;

	private String email;

	private String password;

	private String phone;

	private boolean status;
     
	//@JsonIgnore
	private Set<RoleDTO> roles;
	//@JsonIgnore
	private Set<ClazzTeacherDTO> clazzTeacher;
	
	
	public TeacherDTO() {
		super();
	}



	public TeacherDTO(String teacherName, Date birthDate, boolean gender, String address, String email, String password,
			String phone, boolean status) {
		super();
		this.teacherName = teacherName;
		this.birthDate = birthDate;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.status = status;
		
	}
	
	

	public TeacherDTO(String teacherName, Date birthDate, boolean gender, String address, String email, String password,
			String phone, boolean status, Set<RoleDTO> roles) {
		super();
		this.teacherName = teacherName;
		this.birthDate = birthDate;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.status = status;
		this.roles = roles;
	}



	public TeacherDTO(String teacherName, Date birthDate, boolean gender, String address, String email, String password,
			String phone, boolean status, Set<RoleDTO> roles,  Set<ClazzTeacherDTO> clazzTeacher) {
		super();
		this.teacherName = teacherName;
		this.birthDate = birthDate;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.status = status;
		this.roles = roles;
		this.clazzTeacher = clazzTeacher;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTeacherName() {
		return teacherName;
	}

	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Set<RoleDTO> getRoles() {
		return roles;
	}

	public void setRoles(Set<RoleDTO> roles) {
		this.roles = roles;
	}



	public Set<ClazzTeacherDTO> getClazzTeacher() {
		return clazzTeacher;
	}



	public void setClazzTeacher(Set<ClazzTeacherDTO> clazzTeacher) {
		this.clazzTeacher = clazzTeacher;
	}

		

}
