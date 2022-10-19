package com.system.api.service;

import java.util.List;

import com.system.api.entity.DetailEvaluate;
import com.system.api.model.DetailEvaluateDTO;

public interface DetailEvaluateService {

	// get ds DetailEvaluate
	List<DetailEvaluateDTO> getAllDetailEvaluate();

	// save 1 entity(DetailEvaluate)
	DetailEvaluateDTO saveDetailEvaluate(DetailEvaluateDTO detailEvaluateDTO);

	// get 1 entity(DetailEvaluate) thong qua id
	DetailEvaluateDTO getDetailEvaluate(Integer id);

	// update 1 entity(DetailEvaluate)
	DetailEvaluate updateDetailEvaluate(DetailEvaluate detailEvaluate);

	void deleteById(Integer id);

}
