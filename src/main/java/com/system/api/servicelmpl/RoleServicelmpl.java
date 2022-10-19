package com.system.api.servicelmpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.system.api.entity.Role;
import com.system.api.repository.RoleRepository;
import com.system.api.service.RoleService;

public class RoleServicelmpl implements RoleService {

	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public List<Role> findAll() {
		
		return roleRepository.findAll();
	}

}
