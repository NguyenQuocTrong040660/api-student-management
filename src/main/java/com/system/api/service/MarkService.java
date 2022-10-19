package com.system.api.service;

import java.util.List;

import com.system.api.entity.Mark;
import com.system.api.model.MarkDTO;

public interface MarkService {
	
	//get ds Mark
	List<MarkDTO> getAllMark();
	
	//save 1 entity(Mark)
	MarkDTO saveMark(MarkDTO mark);
	
	//get 1 entity(Mark) thong qua id
	Mark getMark(Integer id);
	
	//update 1 entity(Mark) 
	MarkDTO updateMark(MarkDTO mark);
	
	void deleteById(Integer id);

}
