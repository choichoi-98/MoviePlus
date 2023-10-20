package com.hta.movieplus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.service.ReopenUserService;

@Controller
public class ReopenController {

	ReopenUserService reopenUserService;

	@Autowired
	public ReopenController(ReopenUserService reopenUserService) {
		this.reopenUserService = reopenUserService;
	}

	@GetMapping("/event/reopen")
	public String reopenView(Model model) {
		List<Movie> movieList = reopenUserService.getReopenMovieList();

		model.addAttribute("reopenMovieList", movieList);
		return "reopen/reopen_list";
	}
	
	@GetMapping("/event/reopen/detail")
	public String reopenDetailView(Model model, String movieCode) {
		Movie movie = reopenUserService.getDetailReopenMovie(movieCode);

		model.addAttribute("reopenMovie", movie);
		return "reopen/reopen_detail";
	}
	
	@ResponseBody
	@PostMapping("/event/reopen/admitReopen")
	public String admitReopen(@AuthenticationPrincipal Member member, String MOVIE_CODE) {
		String result = reopenUserService.admitReopen(member.getMEMBER_ID(), MOVIE_CODE);
		
		return result;
	}

}