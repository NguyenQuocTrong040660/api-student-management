package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.Mark;
import com.system.api.entity.MarkType;
import com.system.api.model.MarkDTO;
import com.system.api.model.MarkTypeDTO;
import com.system.api.repository.MarkTypeRepository;
import com.system.api.service.MarkTypeService;


@Service
public class MarkTypeServicelmpl implements MarkTypeService {

	@Autowired
	private MarkTypeRepository markTypeRepository;
	
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

	@Override
	public List<MarkTypeDTO> getAllMarkType() {
		
		return markTypeRepository.findAll().stream().map(this::convertIntoDto).toList();
	}

	@Override
	public MarkTypeDTO saveMarkType(MarkTypeDTO markTypeDTO) {
		
		return null;
	}

	@Override
	public MarkType getMarkType(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MarkTypeDTO updateMarkType(MarkTypeDTO markTypeDTO) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void deleteById(Integer id) {
		markTypeRepository.deleteById(id);

	}

}
