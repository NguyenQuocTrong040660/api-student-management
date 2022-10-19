package com.system.api.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode.Include;
import lombok.Getter;
import lombok.Setter;
@Data
@Setter
@Getter
@Entity
public class Offence {
	

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	
	@Column(columnDefinition = "nvarchar(200)")
	private String offenceName;
	
	
	private Integer markOffence;
	
	private boolean status;
	
	@JsonIgnore
	@OneToMany(mappedBy = "Offence")
    private List<DetailEvaluate> detailEvaluates;
	
	@CreationTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="create_at", nullable=false ,updatable=false)
	private Date createTime;
	
	@UpdateTimestamp
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern="MM/dd/yyyy")
	@Column(name="update_at")
	private Date updateTime;

	public Offence() {
		super();
	}

	
	
	public Offence(Integer id, String offenceName, Integer markOffence, boolean status,
			List<DetailEvaluate> detailEvaluates) {
		super();
		this.id = id;
		this.offenceName = offenceName;
		this.markOffence = markOffence;
		this.status = status;
		this.detailEvaluates = detailEvaluates;
	}



	public Offence(String offenceName, Integer markOffence, boolean status, List<DetailEvaluate> detailEvaluates) {
		super();
		this.offenceName = offenceName;
		this.markOffence = markOffence;
		this.status = status;
		this.detailEvaluates = detailEvaluates;
	}



	public Offence(String offenceName, Integer markOffence, boolean status) {
		super();
		this.offenceName = offenceName;
		this.markOffence = markOffence;
		this.status = status;
	}



	public Offence(Integer id, String offenceName, Integer markOffence, boolean status) {
		super();
		this.id = id;
		this.offenceName = offenceName;
		this.markOffence = markOffence;
		this.status = status;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getOffenceName() {
		return offenceName;
	}



	public void setOffenceName(String offenceName) {
		this.offenceName = offenceName;
	}



	public Integer getMarkOffence() {
		return markOffence;
	}



	public void setMarkOffence(Integer markOffence) {
		this.markOffence = markOffence;
	}



	public boolean isStatus() {
		return status;
	}



	public void setStatus(boolean status) {
		this.status = status;
	}



	public List<DetailEvaluate> getDetailEvaluates() {
		return detailEvaluates;
	}



	public void setDetailEvaluates(List<DetailEvaluate> detailEvaluates) {
		this.detailEvaluates = detailEvaluates;
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
