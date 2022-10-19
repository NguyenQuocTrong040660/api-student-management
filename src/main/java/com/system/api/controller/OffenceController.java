package com.system.api.controller;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.Offence;
import com.system.api.model.OffenceDTO;
import com.system.api.service.OffenceService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class OffenceController {

	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private OffenceService offenceService;

	public OffenceDTO convertIntoDto(Offence offence) {

		OffenceDTO offenceDTO = modelMapper.map(offence, OffenceDTO.class);
		return offenceDTO;
	}

	public Offence convertIntoEntity(OffenceDTO offenceDTO) {
		Offence offence = modelMapper.map(offenceDTO, Offence.class);
		return offence;
	}

	// Get All
	@GetMapping("/offences")
	public List<OffenceDTO> getAllPosts() {

		return offenceService.getAllOffence();

	}

	// Create
	@PostMapping("/create-offence")
	public ResponseEntity<OffenceDTO> home(@Valid @RequestBody OffenceDTO OffenceDto) {
		// call service

		return new ResponseEntity<OffenceDTO>(offenceService.saveOffence(OffenceDto),HttpStatus.OK);

	}

	// Create
	@GetMapping("/offence/{id}")
	public ResponseEntity<OffenceDTO> getOffenceById(@PathVariable Integer id) {

		Optional<Offence> offenceOptional = offenceService.getOffence(id);
		return offenceOptional.map(offence -> new ResponseEntity<>(convertIntoDto(offence), HttpStatus.OK))
				.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
	}

	// update
	@PutMapping("/offence/{id}")
	public ResponseEntity<OffenceDTO> updateCategory(@PathVariable Integer id, @RequestBody OffenceDTO OffenceDTO) {
		Optional<Offence> offenceOptional = offenceService.getOffence(id);
		
	   return offenceOptional.map(offence->{
		   OffenceDTO.setId(offence.getId());
		   return new ResponseEntity<>(offenceService.updateOffence(OffenceDTO), HttpStatus.OK);
	   }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
		
	}
}
