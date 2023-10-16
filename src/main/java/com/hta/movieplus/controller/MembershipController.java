package com.hta.movieplus.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.Member;

@Controller
@RequestMapping(value = "/benefit")
public class MembershipController {

	MembershipService membershipService;

	@Autowired
	public MembershipController(MembershipService membershipService) {
		// TODO Auto-generated constructor stub
		this.membershipService = membershipService;
	}

	@GetMapping("/membership")
	public String MembershipMainView() {
		return "membership/membership";
	}

	@GetMapping("/viplounge")
	public ModelAndView vipLoungeView(ModelAndView mv, Principal principal) {
		
		if(principal != null) {
			Member member = membershipService.getMemberByName(principal.getName());
			mv.addObject("membership_member", member);
		}
		
		
		
		mv.setViewName("membership/vip_lounge");

		return mv;
	}
}
