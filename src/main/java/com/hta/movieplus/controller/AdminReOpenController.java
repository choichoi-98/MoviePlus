package com.hta.movieplus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.service.MovieService;

@Controller
public class AdminReOpenController {

	MovieService movieservice;
	
	@Autowired 
	public AdminReOpenController(MovieService movieservice) {
		this.movieservice = movieservice;
	}
	/* private MovieService movieservice; */
	
	@GetMapping("/admin/reopenlist")
	public String reopenList(Movie movielist) {
		return "/admin/reOpenList";
	}
	
	

	/*
	 * @GetMapping("/admin/reopenlist") public String getReOpenList(Model model) {
	 * movieServiceImpl.getEndedMovie(); return "admin/reOpenList"; }
	 */

}
