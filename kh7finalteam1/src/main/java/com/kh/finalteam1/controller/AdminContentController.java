package com.kh.finalteam1.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.CastDto;
import com.kh.finalteam1.entity.ContentDto;
import com.kh.finalteam1.entity.GenreDto;
import com.kh.finalteam1.entity.NoSeriesDto;
import com.kh.finalteam1.entity.ProgramFeatureDto;
import com.kh.finalteam1.entity.YesSeriesDto;
import com.kh.finalteam1.repository.CastDao;
import com.kh.finalteam1.repository.ContentDao;
import com.kh.finalteam1.repository.ContentFeatureDao;
import com.kh.finalteam1.repository.ContentGenreDao;
import com.kh.finalteam1.repository.GenreDao;
import com.kh.finalteam1.repository.ProgramFeatureDao;
import com.kh.finalteam1.repository.SeriesDao;
import com.kh.finalteam1.service.ContentFeatureService;
import com.kh.finalteam1.service.ContentGenreService;
import com.kh.finalteam1.vo.GenreFeatureCastVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/content")
public class AdminContentController {
	
	@Autowired
	private ContentDao contentDao;
	
	@Autowired
	private SeriesDao seriesDao;
	
	@Autowired
	private GenreDao genreDao;
	
	@Autowired
	private ProgramFeatureDao programFeatureDao;
	
	@Autowired
	private ContentGenreDao contentGenreDao;
	
	@Autowired
	private ContentFeatureDao contentFeatureDao;
	
	@Autowired
	private CastDao castDao;

	@GetMapping("/")
	public String content(Model model) {
		List<ContentDto> contentList = contentDao.list();
		model.addAttribute("contentList", contentList);
		return "admin/content";
	}
	
	@GetMapping("/contentDetail")
	public String contentDetail(@RequestParam int contentNo, Model model) {
		ContentDto contentDto = contentDao.get(contentNo);
		model.addAttribute("contentDto", contentDto);
		
		List<GenreFeatureCastVO> contentGenreList  = contentGenreDao.contentGenreLists(contentNo);
		model.addAttribute("contentGenreList", contentGenreList);
		
		List<GenreFeatureCastVO> contentFeatureList  = contentFeatureDao.contentFeatureLists(contentNo);
		model.addAttribute("contentFeatureList", contentFeatureList);
		
		List<GenreFeatureCastVO> contentCastList  = castDao.contentCastLists(contentNo);
		model.addAttribute("contentCastList", contentCastList);
		
		List<GenreDto> genreList = genreDao.list();
		model.addAttribute("genreList", genreList);
		
		List<ProgramFeatureDto> featureList = programFeatureDao.list();
		model.addAttribute("featureList", featureList);
		
		//?????? ????????? (?????? ????????? ??????????????? ?????? ??????)
		if(contentDto.getContentSeries().equals("N")) {
			NoSeriesDto noSeriesDto = seriesDao.noGet(contentNo);
			model.addAttribute("noSeriesDto", noSeriesDto);
			return "admin/noContentDetail";			
		}
		//?????? ?????????(????????? ????????? ???????????? ??????)
		else {
			List<YesSeriesDto> yesSeriesList = seriesDao.yesList(contentNo);
			model.addAttribute("yesSeriesList",yesSeriesList);
			
			List<Integer> seasonSize = new ArrayList<>();
			for(YesSeriesDto yesSeriesDto : yesSeriesList) {
				if(!seasonSize.contains(yesSeriesDto.getContentSeason())) {
					seasonSize.add(yesSeriesDto.getContentSeason());
				}
			}
			
			model.addAttribute("seasonSize", seasonSize);
			return "admin/yesContentDetail";	
		}
	}
	
	//????????? ???????????? ???????????? ?????? (on delete cascade)
	@GetMapping("/contentDelete")
	public String contentDelete(@RequestParam int contentNo, Model model) {
		contentDao.delete(contentNo);
		return "redirect:/admin/content/";
	}
	
	//?????? ?????? ????????? ??????
	@PostMapping("/noContentEdit")
	public String noContentEdit(
			@ModelAttribute ContentDto contentDto,
			@ModelAttribute NoSeriesDto noSeriesDto,
			@RequestParam List<Integer> genreNo, 
			@RequestParam(required = false) List<Integer> featureNo,
			@RequestParam List<String> castName) {
		
		int contentNo = contentDto.getContentNo();
		
		//?????? ????????? ?????? ????????? ??????, ??????, ?????? ?????? ?????? ??? ?????? ??????
		contentGenreDao.deleteAll(contentNo);
		contentFeatureDao.deleteAll(contentNo);
		castDao.deleteAll(contentNo);
		
		contentDao.edit(contentDto);
		seriesDao.noEdit(noSeriesDto);
		
		if(genreNo != null && featureNo != null) {//????????? ?????? ?????? ????????? ??????
			contentGenreService.regist(contentNo, genreNo);
			contentFeatureService.regist(contentNo, featureNo);
		}
		else if(genreNo != null) {//????????? ????????? ??????(?????? x)
			contentGenreService.regist(contentNo, genreNo);
		}
		
		List<CastDto> castList = new ArrayList<>();
		
		for(int i = 0; i < castName.size(); i++) {
			castList.add(CastDto.builder()
									.contentNo(contentNo)
									.castName(castName.get(i))
								.build());	
		}

		castDao.regist(castList);
		return "redirect:contentDetail?contentNo="+contentNo;
	}

	
	//?????? ?????? ????????? ??????
	@PostMapping("/yesContentEdit")
	public String yesContentEdit(
			@ModelAttribute ContentDto contentDto,
			@RequestParam List<Integer> genreNo, 
			@RequestParam(required = false) List<Integer> featureNo,
			@RequestParam List<String> castName) {
		
		int contentNo = contentDto.getContentNo();
		
		contentDao.edit(contentDto);
		
		//?????? ????????? ?????? ????????? ??????, ??????, ?????? ?????? ?????? ??? ?????? ??????
		contentGenreDao.deleteAll(contentNo);
		contentFeatureDao.deleteAll(contentNo);
		castDao.deleteAll(contentNo);
		
		if(genreNo != null && featureNo != null) {//????????? ?????? ?????? ????????? ??????
			contentGenreService.regist(contentNo, genreNo);
			contentFeatureService.regist(contentNo, featureNo);
		}
		else if(genreNo != null) {//????????? ????????? ??????(?????? x)
			contentGenreService.regist(contentNo, genreNo);
		}
		
		List<CastDto> castList = new ArrayList<>();
		
		for(int i = 0; i < castName.size(); i++) {
			castList.add(CastDto.builder()
									.contentNo(contentNo)
									.castName(castName.get(i))
								.build());	
		}

		castDao.regist(castList);
		
		return "redirect:contentDetail?contentNo="+contentNo;
	}
	
	@PostMapping("/episodeEdit")
	public String episodeEdit(@ModelAttribute YesSeriesDto yesSeriesDto) {
		
		seriesDao.yesEdit(yesSeriesDto);
		return "redirect:contentDetail?contentNo="+yesSeriesDto.getContentNo();
	}
	
	@PostMapping("/insertEpisode")
	public String insertEpisode(@ModelAttribute YesSeriesDto yesSeriesDto) {
		seriesDao.yesInsert(yesSeriesDto);
		return "redirect:contentDetail?contentNo="+yesSeriesDto.getContentNo();
	}
	
	//???????????? ???????????? ?????? ????????? ??????????????? ??????
	@GetMapping("/episodeDelete")
	public String episodeDelete(@ModelAttribute YesSeriesDto yesSeriesDto) {
		seriesDao.yesDelete(yesSeriesDto);
		return "redirect:contentDetail?contentNo="+yesSeriesDto.getContentNo();
	}
	
	//contentRegist.jsp ??????
	@GetMapping("/contentRegist")
	public String contentRegist() {
		return "admin/contentRegist";		
	}
	
	//????????? ?????? ??????
	@GetMapping("/contentRegist2")
	public String contentRegist2() {
		return "admin/contentRegist2";		
	}
	
	//????????? ????????? ??????
	@GetMapping("/contentRegist3")
	public String contentRegist3() {
		return "admin/contentRegist3";		
	}
		
	//????????? ?????? ??? ?????? ????????? ????????? ?????? ????????? ??????
	@PostMapping("/contentRegist")
	public String contentRegist(@ModelAttribute ContentDto contentDto, HttpSession session) {
		int contentNo = contentDao.sequence();
		contentDto.setContentNo(contentNo);
		contentDao.insert(contentDto);		
		
		//????????? contentNo ???????????? ?????? ?????? ??????????????? contentNo ?????? ??????
		session.setAttribute("contentNo", contentNo);
		
		YesSeriesDto yesSeriesDto = (YesSeriesDto)session.getAttribute("yesSeriesDto");
		NoSeriesDto noSeriesDto = (NoSeriesDto)session.getAttribute("noSeriesDto");
		
		if(yesSeriesDto != null) {
			yesSeriesDto.setContentNo(contentNo);
			seriesDao.yesInsert(yesSeriesDto);			
			session.removeAttribute("yesSeriesDto");
		}
		else if(noSeriesDto != null) {
			noSeriesDto.setContentNo(contentNo);
			seriesDao.noInsert(noSeriesDto);			
			session.removeAttribute("noSeriesDto");
		}

		return "redirect:/admin/content/genreFeatureRegist";
	}
	
	//????????? ?????? & ????????? ?????? ?????? ?????????
	@GetMapping("/genreFeatureRegist")
	public String genreFeatureRegist(Model model) {
		
		List<GenreDto> genreList = genreDao.list();
		List<ProgramFeatureDto> featureList = programFeatureDao.list();
		
		model.addAttribute("genreList", genreList);
		model.addAttribute("featureList", featureList);
		
		return "admin/genreFeatureRegist";
	}
	
	@Autowired
	private ContentGenreService contentGenreService;
	
	@Autowired
	private ContentFeatureService contentFeatureService;
	
	//????????? ?????? ???????????? ??????????????? required=false
	//?????? ?????? , ?????? ??????
	@PostMapping("/genreFeatureRegist")
	public String genreFeatureRegist(
			@RequestParam List<Integer> genreNo, @RequestParam(required = false) List<Integer> featureNo,
			HttpSession session) {
		
		log.debug("genreNoList = {}", genreNo);
		log.debug("featureNoList = {}", featureNo);
		int contentNo = (Integer)session.getAttribute("contentNo");
		//int contentNo = 1;
		
		if(genreNo != null && featureNo != null) {//????????? ?????? ?????? ????????? ??????
			contentGenreService.regist(contentNo, genreNo);
			contentFeatureService.regist(contentNo, featureNo);
		}
		else if(genreNo != null) {//????????? ????????? ??????(?????? x)
			contentGenreService.regist(contentNo, genreNo);
		}
		
		return "redirect:/admin/content/castRegist";
	}
	
	//????????? ??????
	@GetMapping("/castRegist")
	public String castRegist() {
		return "admin/castRegist";
	}
	
	@PostMapping("/castRegist")
	public String castRegist(
			@RequestParam List<String> castName,
			HttpSession session) {
		
		int contentNo = (Integer)session.getAttribute("contentNo");
		
		List<CastDto> list = new ArrayList<>();
		
		for(int i = 0; i < castName.size(); i++) {
				list.add(CastDto.builder()
									.contentNo(contentNo)
									.castName(castName.get(i))
								.build());	
		}

		log.debug("castRegistDto = {}", list);
		castDao.regist(list);
		
		//	castService.cast(contentNo,castName);
		
		//???????????? ???????????? session?????? contentNo ??????
		session.removeAttribute("contentNo");
		
		return "redirect:/admin/content/";
	}
}
