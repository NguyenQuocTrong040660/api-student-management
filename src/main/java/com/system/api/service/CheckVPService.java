package com.system.api.service;

import java.util.List;
import java.util.Optional;

import com.system.api.entity.CheckVP;
import com.system.api.model.CheckVPDTO;


public interface CheckVPService {

	// get ds Clazz
		List<CheckVPDTO> getAll();

		// save 1 entity(Clazz)
		CheckVPDTO saveCheckVP(CheckVPDTO checkVPDTO);

		// get 1 entity(Clazz) thong qua id
		 Optional<CheckVP> getCheckVP(Integer id);

		void deleteById(Integer id);
	
}
