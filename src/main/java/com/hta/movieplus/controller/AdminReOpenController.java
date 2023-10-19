package com.hta.movieplus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hta.movieplus.service.MovieServiceImpl;

@Controller
public class AdminReOpenController {
	
	@Autowired
	private MovieServiceImpl movieServiceImpl;
	
	@GetMapping("/admin/reopenlist")
	public String getReOpenList(Model model) {
		movieServiceImpl.getEndedMovie();
		return "admin/reOpenList";
	}
	
	
	@PostMapping("/admin/reopenwrite")
	public String writeReOpen() {
		return "admin/reOpenWrite";
	}
}
