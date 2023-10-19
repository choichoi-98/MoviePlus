package com.hta.movieplus.controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.domain.MovieReviewVO;
import com.hta.movieplus.service.MovieStoryService;

@Controller
public class MovieStoryController {

	MovieStoryService movieStoryService;
	
	public MovieStoryController(MovieStoryService movieStoryService) {
		// TODO Auto-generated constructor stub
		this.movieStoryService = movieStoryService;
	}
	
	
	@GetMapping("/member/mypage/moviestory")
	public String movieStoryMainView(@AuthenticationPrincipal Member member, Model model) {
		String memberId = member.getMEMBER_ID();
		
		List<MoviePostVO> postList = movieStoryService.getMoviePostList(memberId);
		List<Movie> movieList = movieStoryService.getMovieDibsList(memberId);
		List<MovieReviewVO> reviewList = movieStoryService.getMovieReviewList(memberId);

		
		model.addAttribute("postList", postList);

		model.addAttribute("ms_movieCnt", movieList.size());
		model.addAttribute("ms_movieList", movieList);
		
		model.addAttribute("reviewList", reviewList);
		
		return "member/mypage_moviestory";
	}

}
