package com.kh.finalteam1.controller;


import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalteam1.entity.ClientDto;
import com.kh.finalteam1.repository.ClientDao;

@Controller
public class LoginController {
	@Autowired
	private ClientDao clientDao; 
	
	@GetMapping("/login")
	public String login() {
		return "login/login"; 
	}

	@GetMapping("/join1")
	public String join1() {
		return "login/join1";
	}
	
	@PostMapping("/join1")
	public String join1(@RequestParam String email, Model model){
		model.addAttribute("email", email);
		
		return "redirect:/join2";
	}

	@GetMapping("/join2")
	public String join2() {
		return "login/join2";
	}


	@GetMapping("join3")
	public String join3() {
		return "login/join3";
	}


	@GetMapping("join4")
	public String join4() {
		return "login/join4";
	}
	
	@PostMapping("regitCheck")
	public String regitCheck(@RequestParam String email , Model model ) {
	
		ClientDto clientDto = clientDao.regitCheck(email);
		
		model.addAttribute("email", email);
		
		if(clientDto == null) {
			return "redirect:join1";
		}
		else {			
			return "login/login";
		}
	}
	@PostMapping("loginCheck")
	public String loginCheck(@ModelAttribute ClientDto clientDto) {
		//System.out.println(email);
		//System.out.println(pw);

		ClientDto client = clientDao.loginCheck(clientDto);

		if(client ==null) {

			return "redirect: login";
		}
		else {
			return"/main";
		}
	}
	@PostMapping("joinCheck")
	public String joinCheck(@ModelAttribute ClientDto clientDto) {
		clientDao.joinCheck(clientDto);
		
		return "redirect:/join3";
	}
}