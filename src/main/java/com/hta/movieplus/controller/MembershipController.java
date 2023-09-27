package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/benefit")
public class MembershipController {
	
	@GetMapping("/membership")
	public String MembershipMainView() {
		return "membership/membership";
	}
	
	@GetMapping("/viplounge")
	public String vipLoungeView() {
		return "membership/vip_lounge";
	}
}
