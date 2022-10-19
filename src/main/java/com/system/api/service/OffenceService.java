package com.system.api.service;

import java.util.List;
import java.util.Optional;

import com.system.api.entity.Offence;
import com.system.api.model.OffenceDTO;

public interface OffenceService {
	
	   //get ds Offence
		List<OffenceDTO> getAllOffence();
		
		//save 1 entity(Offence)
		OffenceDTO saveOffence(OffenceDTO offenceDTO);
		
		//get 1 entity(Offence) thong qua id
		Optional<Offence> getOffence(Integer id);
		
		//update 1 entity(Offence) 
		OffenceDTO updateOffence(OffenceDTO offenceDTO);
		
		void deleteById(Integer id);


}
