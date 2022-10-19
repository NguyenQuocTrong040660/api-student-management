package com.system.api.entity;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(uniqueConstraints = {

		@UniqueConstraint(columnNames = "email") })
public class Teacher {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotBlank
	@Column(columnDefinition = "nvarchar(100)")
	private String teacherName;

	private Date birthDate;

	private boolean gender;

	@NotBlank
	@Column(columnDefinition = "nvarchar(200)")
	private String address;
    
	@NotBlank
	@Email
	private String email;

	@NotBlank
	private String password;

	private String phone;

	private boolean status;

	// Relationship
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "teacher_role", joinColumns = @JoinColumn(name = "teacher_id"), 
	inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles = new HashSet<>();

	// Relationship with ClazzTeacher
	
	@OneToMany(mappedBy = "teacher")
	private Set<ClazzTeacher> clazzTeacher;
	
	

	
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy")
	@Column(name = "create_at", nullable = false, updatable = false)
	private Date createTime;

	@UpdateTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy")
	@Column(name = "update_at")
	private Date updateTime;
	
	
	

	public Teacher() {
		super();
	}



	public Teacher(String teacherName, Date birthDate, boolean gender, String address, String email, String password,
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

	public Teacher( String teacherName, Date birthDate, boolean gender,  String address,
			  String email,  String password, String phone, boolean status, Set<Role> roles) {
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



	public Teacher( String teacherName, Date birthDate, boolean gender,  String address,
			  String email,  String password, String phone, boolean status, Set<Role> roles,
			Set<ClazzTeacher> clazzTeacher) {
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




	public Set<Role> getRoles() {
		return roles;
	}




	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}


	public Set<ClazzTeacher> getClazzTeacher() {
		return clazzTeacher;
	}



	public void setClazzTeacher(Set<ClazzTeacher> clazzTeacher) {
		this.clazzTeacher = clazzTeacher;
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
