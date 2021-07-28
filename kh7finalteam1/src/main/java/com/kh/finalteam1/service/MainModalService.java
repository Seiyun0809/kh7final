package com.kh.finalteam1.service;

import java.util.List;

import com.kh.finalteam1.vo.MainModalDetailVO;
import com.kh.finalteam1.vo.SimilarContentVO;

public interface MainModalService {
	List<String> getGenre(int contentNo);
	List<String> getFeature(int contentNo);
	List<String> getCast(int contentNo);
	MainModalDetailVO getModalDetailVO(int contentNo, int clientNo);
	void insertWishList(int clientNo, int contentNo);
	void deleteWishList(int clientNo, int contentNo);
	List<SimilarContentVO> getSimilarList(List<String> genreList);
}
