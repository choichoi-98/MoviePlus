package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/theater")
public class TheaterController {
	
	@GetMapping("/")
	public String theaterMain() {
		return "theater/theater_main";
	}
	
	@GetMapping("/detail")
	public String theaterDetail() {
		return "theater/theater_detail";
	}
}
