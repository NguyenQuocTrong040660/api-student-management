package com.system.api.controller;

import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.Clazz;
import com.system.api.entity.Schedule;
import com.system.api.entity.Teacher;
import com.system.api.model.ClazzDTO;
import com.system.api.model.ScheduleDTO;
import com.system.api.model.TeacherDTO;
import com.system.api.service.ClazzService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class ClazzController {
	
	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private ClazzService clazzService;
	
    //convert Entity => DTO
	public ClazzDTO convertIntoDto(Clazz clazz) {

		ClazzDTO clazzDTO = modelMapper.map(clazz, ClazzDTO.class);
		return clazzDTO;
	}

	//convert DTO => Entity
	public Clazz convertIntoEntity(ClazzDTO clazzDTO) {
		Clazz clazz = modelMapper.map(clazzDTO, Clazz.class);
		return clazz;
	}
	
	//get All
		@GetMapping("/clazzs")
		public List<ClazzDTO> getAllPosts() {

			return clazzService.findAllByStatus(true);

		}
		
		//create
		@PostMapping("/clazz")
		
		public ResponseEntity<ClazzDTO> home(@Valid @RequestBody ClazzDTO clazzDTO) {
			// call service
			return new ResponseEntity<ClazzDTO>(clazzService.saveClazz(clazzDTO),HttpStatus.OK);

		}
		
		//get 1 entity
				@GetMapping("/clazz/{id}")
				public ResponseEntity<ClazzDTO> getOffenceById(@PathVariable Integer id) {

					Optional<Clazz> clazzOptional = clazzService.getClazz(id);
					return clazzOptional.map(clazzItem -> new ResponseEntity<>(convertIntoDto(clazzItem), HttpStatus.OK))
							.orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
				}
				
				
				//update
				@PutMapping("/clazz/{id}")
				public ResponseEntity<ClazzDTO> update(@PathVariable Integer id,@RequestBody ClazzDTO clazzDTO){
					
					Optional<Clazz> clazzOptional = clazzService.getClazz(id);
					
					   return clazzOptional.map(item->{
						   clazzDTO.setId(item.getId());
						   return new ResponseEntity<>(clazzService.updateClazz(clazzDTO), HttpStatus.OK);
					   }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
						
				}	
				
				@PutMapping("/clazz-delete/{id}")
				public ResponseEntity<ClazzDTO> deleteClazzById(@PathVariable Integer id,@RequestBody ClazzDTO clazzDTO) {
					Optional<Clazz> clazzOptional = clazzService.getClazz(id);
					
					   return clazzOptional.map(item->{
						   clazzDTO.setStatus(false);
						   return new ResponseEntity<>(clazzService.updateClazz(clazzDTO), HttpStatus.OK);
					   }).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
						
				}
	
	
	

}
