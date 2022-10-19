package com.system.api.request;

import java.util.Date;
import java.util.Set;

public class SignUpForm {
	
	private String teacherName;

	private Date birthDate;

	private boolean gender;

	private String address;

	private String email;

	private String password;

	private String phone;

	private boolean status;
	
	private Set<String> role;

	public SignUpForm() {
		super();
	}

	public SignUpForm(String teacherName, Date birthDate, boolean gender, String address, String email, String password,
			String phone, boolean status, Set<String> role) {
		super();
		this.teacherName = teacherName;
		this.birthDate = birthDate;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.status = status;
		this.role = role;
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

	public Set<String> getRole() {
		return role;
	}

	public void setRole(Set<String> role) {
		this.role = role;
	}
	
	
	
	
	

}
