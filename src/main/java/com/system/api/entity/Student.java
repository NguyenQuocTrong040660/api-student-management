package com.system.api.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;


@Entity
public class Student {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@NotBlank
	@Column(columnDefinition = "nvarchar(100)")
	private String nameStudent;
	
	
	private Date birthDate;
	
	private boolean gender;
	
	@Column(columnDefinition = "nvarchar(200)")
	private String address;
	
	@Email
	@Column(columnDefinition = "nvarchar(50)")
	private String email;
	
	private String phone;
	
	private boolean status;
		
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "studentFamily_id", nullable = false)
    private StudentFamily studentFamily; 
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "clazz_id", nullable = false)
	private Clazz clazz;
	
	
	@JsonIgnore
	@OneToMany(mappedBy = "student",cascade = CascadeType.ALL)
	private List<CheckVP> checkVP;
	
	@JsonIgnore
	@OneToMany(mappedBy = "student",cascade = CascadeType.ALL)
	private List<Mark> mark;
	
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="create_at", nullable=false ,updatable=false)
	private Date createTime;
	
	@UpdateTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="update_at")
	private Date updateTime;
	
	

	public Student() {
		super();
	}


	public Student( String nameStudent,  Date birthDate, boolean gender, String address,  String email,
			String phone, boolean status) {
		super();
		this.nameStudent = nameStudent;
		this.birthDate = birthDate;
		this.gender = gender;
		this.address = address;
		this.email = email;
		this.phone = phone;
		this.status = status;
	}


	public Student( String nameStudent,  Date birthDate, boolean gender, String address,  String email,
			String phone, boolean status, StudentFamily studentFamily, Clazz clazz) {
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


	public StudentFamily getStudentFamily() {
		return studentFamily;
	}


	public void setStudentFamily(StudentFamily studentFamily) {
		this.studentFamily = studentFamily;
	}


	public Clazz getClazz() {
		return clazz;
	}


	public void setClazz(Clazz clazz) {
		this.clazz = clazz;
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
