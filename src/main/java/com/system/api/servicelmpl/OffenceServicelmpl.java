package com.system.api.servicelmpl;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.system.api.entity.DetailEvaluate;
import com.system.api.entity.Offence;
import com.system.api.model.OffenceDTO;
import com.system.api.repository.OffenceRepository;
import com.system.api.service.OffenceService;

@Service
public class OffenceServicelmpl implements OffenceService {

	@Autowired
	private OffenceRepository offenceRepository;
	
	@Autowired
	private ModelMapper modelMapper;
	
	
	public OffenceDTO convertIntoDto(Offence offence) {
		
		OffenceDTO offenceDTO = modelMapper.map(offence, OffenceDTO.class);
        return offenceDTO;
    }
    
    public Offence convertIntoEntity(OffenceDTO offenceDTO) {
    	Offence offence = modelMapper.map(offenceDTO, Offence.class);
        return offence;
    }

	@Override
	public List<OffenceDTO> getAllOffence() {

		return  offenceRepository.findAll().stream().map(this::convertIntoDto).collect(Collectors.toList());
		
	}

	@Override
	public OffenceDTO saveOffence(OffenceDTO offenceDTO) {
             
		Offence offence = offenceRepository.save(convertIntoEntity(offenceDTO));
		return convertIntoDto(offence);
	}

	@Override
	public Optional<Offence> getOffence(Integer id) {
		return offenceRepository.findById(id);
		
	}

	@Override
	public OffenceDTO updateOffence(OffenceDTO offenceDTO) {

		return convertIntoDto(offenceRepository.save(convertIntoEntity(offenceDTO)));
	}

	@Override
	public void deleteById(Integer id) {
		offenceRepository.deleteById(id);

	}

}
