package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.Mark;
import com.system.api.entity.Offence;
import com.system.api.model.MarkDTO;
import com.system.api.model.OffenceDTO;
import com.system.api.repository.MarkRepository;
import com.system.api.service.MarkService;


@Service
public class MarkServicelmpl implements MarkService {
	
	

	@Autowired
	private MarkRepository markRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	
	public MarkDTO convertIntoDto(Mark mark) {
		
		MarkDTO markDTO = modelMapper.map(mark, MarkDTO.class);
        return markDTO;
    }
    
    public Mark convertIntoEntity(MarkDTO markDTO) {
    	Mark mark = modelMapper.map(markDTO, Mark.class);
        return mark;
    }

	@Override
	public List<MarkDTO> getAllMark() {
		
		return markRepository.findAll().stream().map(this::convertIntoDto).toList();
	}

	@Override
	public MarkDTO saveMark(MarkDTO mark) {
		return convertIntoDto(markRepository.save(convertIntoEntity(mark)));
	}

	@Override
	public Mark getMark(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MarkDTO updateMark(MarkDTO mark) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteById(Integer id) {
		markRepository.deleteById(id);
		
	}
	
	
}
