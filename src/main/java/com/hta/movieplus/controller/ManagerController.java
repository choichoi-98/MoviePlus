package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {

	//메뉴바 이동 부분만
	
	@GetMapping("/") 
	public String theaterMainView() {
		return "manager/main";
	}
	
	@GetMapping("/scheduling")
	public String theaterSchedulingView() {
		return "manager/scheduling";
	}

}
