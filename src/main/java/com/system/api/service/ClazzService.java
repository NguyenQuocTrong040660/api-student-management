package com.system.api.service;

import java.util.List;
import java.util.Optional;

import com.system.api.entity.Clazz;
import com.system.api.model.ClazzDTO;

public interface ClazzService {

	// get ds Clazz
	List<ClazzDTO> getAllClazz();

	// save 1 entity(Clazz)
	ClazzDTO saveClazz(ClazzDTO clazz);

	// get 1 entity(Clazz) thong qua id
	 Optional<Clazz> getClazz(Integer id);

	// update 1 entity(Clazz)
	 ClazzDTO updateClazz(ClazzDTO clazz);

	void deleteById(Integer id);
	
	List<ClazzDTO>findAllByStatus(boolean status);
}
