package com.system.api.controller;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.MarkType;
import com.system.api.model.MarkDTO;
import com.system.api.model.MarkTypeDTO;
import com.system.api.service.MarkTypeService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class MarkTypeController {
	
	@Autowired
	private MarkTypeService markTypeService;
	
	@Autowired
	private ModelMapper modelMapper;
	
	
	public MarkTypeDTO convertIntoDto(MarkType markType) {
		
		MarkTypeDTO markTypeDTO = modelMapper.map(markType, MarkTypeDTO.class);
        return markTypeDTO;
    }
    
    public MarkType convertIntoEntity(MarkTypeDTO markTypeDTO) {
    	MarkType markType = modelMapper.map(markTypeDTO, MarkType.class);
        return markType;
    }
    
    @GetMapping("/mark-types")
    public List<MarkTypeDTO> getAll() {

		return markTypeService.getAllMarkType();

	}


}
