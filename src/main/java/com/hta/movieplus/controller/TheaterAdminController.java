package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin/theater")
public class TheaterAdminController {

	@GetMapping("num") // 극장 넘버
	public String theaterMainView() {
		return "admin/theater/main";
	}

}
