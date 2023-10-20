package com.hta.movieplus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.service.MovieService;
import com.hta.movieplus.service.ReOpenService;

@Controller
public class AdminReOpenController {

	ReOpenService reopenservice;
	
	@Autowired 
	public AdminReOpenController(ReOpenService reopenservice) {
		this.reopenservice = reopenservice;
	}
	
	@GetMapping("/admin/goreopenwrite")
	public String getEndedMoive(Model model){
		List<Movie> endedMoiveList = reopenservice.getEndedMovieList();
		/*
		 * for (Movie review : endedMoiveList) {
		 * System.out.println("getMovie_Title ID: " + review.getMovie_Title());
		 * System.out.println("getMovie_Director content: " +
		 * review.getMovie_Director()); }
		 */
		model.addAttribute("endedMovieList",endedMoiveList);
		return "/admin/reOpenWrite";
	}
	
	
	
	
	
	
	
	@PostMapping("/admin/reopenwrite")
	public String goreopenwrite() {
		return "/admin/reOpenList";
	}
	
	
	
	
	@GetMapping("/admin/reopenlist")
	public String reopenList(Movie movielist) {
		return "/admin/reOpenList";
	}
	
	

	/*
	 * @GetMapping("/admin/reopenlist") public String getReOpenList(Model model) {
	 * movieServiceImpl.getEndedMovie(); return "admin/reOpenList"; }
	 */

}
