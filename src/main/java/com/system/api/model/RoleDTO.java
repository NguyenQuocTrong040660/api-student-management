package com.system.api.model;



import com.system.api.entity.ERole;

public class RoleDTO {
	
	private Integer id;
	
	private ERole name;
	
	

	public RoleDTO() {
		super();
	}
	
	public RoleDTO( ERole name) {
		super();
		
		this.name = name;
	}

	public RoleDTO(Integer id, ERole name) {
		super();
		this.id = id;
		this.name = name;
	}



	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ERole getName() {
		return name;
	}

	public void setName(ERole name) {
		this.name = name;
	}
	
	
	
	
}
