package com.system.api.service;

import java.util.List;

import com.system.api.entity.MarkType;
import com.system.api.model.MarkTypeDTO;

public interface MarkTypeService {
	
	       //get ds MarkType
			List<MarkTypeDTO> getAllMarkType();
			
			//save 1 entity(MarkType)
			MarkTypeDTO saveMarkType(MarkTypeDTO markTypeDTO);
			
			//get 1 entity(MarkType) thong qua id
			MarkType getMarkType(Integer id);
			
			//update 1 entity(MarkType) 
			MarkTypeDTO updateMarkType(MarkTypeDTO markTypeDTO);
			
			void deleteById(Integer id);

}
