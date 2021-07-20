package com.kh.finalteam1.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalteam1.entity.content.GenreDto;
import com.kh.finalteam1.entity.content.NoSeriesDto;
import com.kh.finalteam1.entity.content.ProgramFeatureDto;
import com.kh.finalteam1.entity.content.YesSeriesDto;
import com.kh.finalteam1.repository.genre.GenreDao;
import com.kh.finalteam1.repository.programfeature.ProgramFeatureDao;
import com.kh.finalteam1.repository.series.SeriesDao;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/data")
@Slf4j
public class AdminDataController {
	
	@Autowired
	private GenreDao genreDao;
	
	@Autowired
	private ProgramFeatureDao programFeatureDao;
	
	@GetMapping("/admin/searchGenre")
	public List<GenreDto> searchGenre(@RequestParam String genreName) {
		return genreDao.get(genreName);
		
	}
	
	@GetMapping("/admin/searchFeature")
	public List<ProgramFeatureDto> searchFeature(@RequestParam String featureName) {
		return programFeatureDao.get(featureName);
		
	}
	
	@Autowired
	private SeriesDao seriesDao;
	
	@PostMapping("/series/yes")
	public void seriesInsertYes(
			HttpSession session, @ModelAttribute YesSeriesDto yesSeriesDto) {
			log.debug("yesSeriesDto = {}" , yesSeriesDto);
			session.setAttribute("yesSeriesDto", yesSeriesDto);
	}
	
	@PostMapping("/series/no")
	public void seriesInsertNo(
			HttpSession session, @ModelAttribute NoSeriesDto noSeriesDto) {
			log.debug("noSeriesDto = {}" , noSeriesDto);
			session.setAttribute("noSeriesDto", noSeriesDto);
	}
	
}