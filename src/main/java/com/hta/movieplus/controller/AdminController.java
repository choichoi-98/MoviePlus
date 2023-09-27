package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	//메뉴바 이동 부분만
	@GetMapping("/")
	public String siteAdminMainView() {
		return "admin/main";
	}

	@GetMapping("/managetheater")
	public String manageTheaterView() {
		return "admin/manageTheater";
	}	
	
	@GetMapping("/addtheater")
	public String addTheaterView() {
		return "admin/addTheater";
	}
	
}
