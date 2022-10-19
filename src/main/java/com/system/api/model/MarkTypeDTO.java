package com.system.api.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.system.api.entity.Mark;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MarkTypeDTO {

	private Integer id;

	private String markTypeName;

	private float markNumber;

	@JsonIgnore
	private List<MarkDTO> marks;

	public MarkTypeDTO() {
		super();
	}

	public MarkTypeDTO(String markTypeName, float markNumber) {
		super();
		this.markTypeName = markTypeName;
		this.markNumber = markNumber;
	}

	
	
	public MarkTypeDTO(Integer id, String markTypeName, float markNumber) {
		super();
		this.id = id;
		this.markTypeName = markTypeName;
		this.markNumber = markNumber;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMarkTypeName() {
		return markTypeName;
	}

	public void setMarkTypeName(String markTypeName) {
		this.markTypeName = markTypeName;
	}

	public List<MarkDTO> getMarks() {
		return marks;
	}

	public void setMarks(List<MarkDTO> marks) {
		this.marks = marks;
	}

	public float getMarkNumber() {
		return markNumber;
	}

	public void setMarkNumber(float markNumber) {
		this.markNumber = markNumber;
	}

}
