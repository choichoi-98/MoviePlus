package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/benefit")
public class MembershipController {
	
	@GetMapping("/membership")
	public String theaterMainView() {
		return "membership/membership";
	}
	
	@GetMapping("/viplounge")
	public String theaterDetailView() {
		return "membership/vip_lounge";
	}
}
