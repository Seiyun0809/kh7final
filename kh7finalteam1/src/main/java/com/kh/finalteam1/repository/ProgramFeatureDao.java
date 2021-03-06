package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.ProgramFeatureDto;

public interface ProgramFeatureDao {
	void insert(String featureName);
	List<ProgramFeatureDto> list();
	List<ProgramFeatureDto> get(String featureName);
	boolean delete(String featureName);
	boolean edit(ProgramFeatureDto programFeatureDto);
	
}
