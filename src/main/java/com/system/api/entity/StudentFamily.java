package com.system.api.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(uniqueConstraints = {

		@UniqueConstraint(columnNames = "email1") })
public class StudentFamily {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotBlank
	@Column(columnDefinition = "nvarchar(100)")
	private String motherName;

	@NotBlank
	@Column(columnDefinition = "nvarchar(100)")
	private String fatherName;

	@NotBlank
	@Email
	@Column(columnDefinition = "nvarchar(100)")
	private String email1;

	private String phone1;

	@JsonIgnore
	@OneToMany(mappedBy = "studentFamily",cascade = CascadeType.ALL)
	private List<Student> students;

	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy")
	@Column(name = "create_at", nullable = false, updatable = false)
	private Date createTime;

	@UpdateTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "MM/dd/yyyy")
	@Column(name = "update_at")
	private Date updateTime;

	public StudentFamily() {
		super();
	}

	public StudentFamily(Integer id, String motherName, String fatherName, String email1, String phone1) {
		super();
		this.id = id;
		this.motherName = motherName;
		this.fatherName = fatherName;
		this.email1 = email1;
		this.phone1 = phone1;
	}

	public StudentFamily(String motherName, String fatherName, String email1, String phone1) {
		super();
		this.motherName = motherName;
		this.fatherName = fatherName;
		this.email1 = email1;
		this.phone1 = phone1;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMotherName() {
		return motherName;
	}

	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
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
