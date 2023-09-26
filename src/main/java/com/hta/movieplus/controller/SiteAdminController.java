package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/site")
public class SiteAdminController {

	@GetMapping("/")
	public String theaterDetailView() {
		return "admin/site/main";
	}
}
