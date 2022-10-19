package com.system.api.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.system.api.entity.CheckVP;
import com.system.api.entity.Mark;
 

public class StudentDTO {
	
	
	private Integer id;
	
	private String nameStudent;
	
	private Date birthDate;
	
	private boolean gender;
	
	private String address;
	
	private String email;
	
	private String phone;
	
	private boolean status;
	
    private StudentFamilyDTO studentFamily; 
	
	private ClazzDTO clazz;
	
	@JsonIgnore
	private List<CheckVP> checkVP;
	
	@JsonIgnore
	private List<Mark> mark;
	

	public StudentDTO() {
		super();
	}

	

	public StudentDTO(String nameStudent, Date birthDate, boolean gender, String address, String email, String phone,
			boolean status, StudentFamilyDTO studentFamily, ClazzDTO clazz) {
		super();
		this.nameStudent = nameStudent;
		this.birthDate = birthDate;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.studentFamily = studentFamily;
		this.clazz = clazz;
	}
	
	
	public StudentDTO(String nameStudent, Date birthDate, boolean gender, String address, String email, String phone,
			boolean status, StudentFamilyDTO studentFamily, ClazzDTO clazz, List<CheckVP> checkVP) {
		super();
		this.nameStudent = nameStudent;
		this.birthDate = birthDate;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.status = status;
		this.studentFamily = studentFamily;
		this.clazz = clazz;
		this.checkVP = checkVP;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNameStudent() {
		return nameStudent;
	}

	public void setNameStudent(String nameStudent) {
		this.nameStudent = nameStudent;
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

	public StudentFamilyDTO getStudentFamily() {
		return studentFamily;
	}

	public void setStudentFamily(StudentFamilyDTO studentFamily) {
		this.studentFamily = studentFamily;
	}

	public ClazzDTO getClazz() {
		return clazz;
	}

	public void setClazz(ClazzDTO clazz) {
		this.clazz = clazz;
	}



	public List<CheckVP> getCheckVP() {
		return checkVP;
	}



	public void setCheckVP(List<CheckVP> checkVP) {
		this.checkVP = checkVP;
	}



	public List<Mark> getMark() {
		return mark;
	}



	public void setMark(List<Mark> mark) {
		this.mark = mark;
	}

	
	

	
	

}
