package com.system.api.model;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


public class OffenceDTO {

	private Integer id;
	
	private String offenceName;
	
	private Integer markOffence;
	
	private boolean status;
	
	@JsonIgnore
    private List<DetailEvaluateDTO> detailEvaluates;
    
  


	
	
	public OffenceDTO() {
		super();
	}


	public OffenceDTO(Integer id, String offenceName, Integer markOffence, boolean status,
			List<DetailEvaluateDTO> detailEvaluates) {
		super();
		this.id = id;
		this.offenceName = offenceName;
		this.markOffence = markOffence;
		this.status = status;
		this.detailEvaluates = detailEvaluates;
		
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


	public List<DetailEvaluateDTO> getDetailEvaluates() {
		return detailEvaluates;
	}


	public void setDetailEvaluates(List<DetailEvaluateDTO> detailEvaluates) {
		this.detailEvaluates = detailEvaluates;
	}


	
	
    
	
	
    
	
}
