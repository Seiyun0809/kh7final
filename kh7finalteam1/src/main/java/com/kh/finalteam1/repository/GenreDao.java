package com.kh.finalteam1.repository;

import java.util.List;

import com.kh.finalteam1.entity.GenreDto;

public interface GenreDao {
	void insert(String genreName);
	List<GenreDto> list();
	List<GenreDto> get(String genreName);
	boolean delete(String genreName);
	boolean edit(GenreDto genreDto);
}