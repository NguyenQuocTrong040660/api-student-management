package com.system.api.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.entity.Mark;
import com.system.api.entity.Offence;
import com.system.api.model.ClazzDTO;
import com.system.api.model.MarkDTO;
import com.system.api.model.OffenceDTO;
import com.system.api.repository.MarkRepository;
import com.system.api.service.MarkService;

import lombok.ToString;

@ToString
@CrossOrigin("*")
@RestController
@RequestMapping("/api/v1")
public class MarkController {
	@Autowired
	private MarkRepository markRepository;

	@Autowired
	private MarkService markService;

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

	// get All
	@GetMapping("/marks")
	public List<MarkDTO> getAll() {

		return markService.getAllMark();

	}

	// create
	@PostMapping("/mark")

	public ResponseEntity<MarkDTO> home(@Valid @RequestBody MarkDTO markDTO) {
		// call service
		return new ResponseEntity<MarkDTO>(markService.saveMark(markDTO), HttpStatus.OK);

	}
	
	@GetMapping("/mark-by-subject-semester-studentid/{subjectId}/{semecter}/{studentid}")
	public List<MarkDTO> getAllByCondition(@PathVariable Integer subjectId, @PathVariable Integer semecter,@PathVariable Integer studentid) {
	return markRepository.findBySubjectIdAndSemesterAndStudentId(subjectId, semecter, studentid).stream().map(this::convertIntoDto).toList();
	}
	
	@DeleteMapping("/delete-mark/{id}")
	public void deleteMark(@PathVariable Integer id) {
		markService.deleteById(id);
	}

}
