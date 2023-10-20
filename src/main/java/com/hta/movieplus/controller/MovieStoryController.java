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
import com.hta.movieplus.domain.TheaterSchedule;
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
		List<TheaterSchedule> scheduleList = movieStoryService.getScheduleList(memberId);
		List<Movie> movieList = movieStoryService.getMovieDibsList(memberId);
		List<MovieReviewVO> reviewList = movieStoryService.getMovieReviewList(memberId);

		model.addAttribute("ms_postCnt", postList.size());
		model.addAttribute("ms_postList", postList);
		
		model.addAttribute("ms_scheduleList", scheduleList);
		model.addAttribute("ms_scheduleCnt", scheduleList.size());

		model.addAttribute("ms_movieCnt", movieList.size());
		model.addAttribute("ms_movieList", movieList);
		
		
		model.addAttribute("ms_reviewCnt", reviewList.size());
		model.addAttribute("ms_reviewList", reviewList);
		
		return "member/mypage_moviestory";
	}
	
	@GetMapping("/member/mypage/deleteReview")
	public String deleteReview(String review_num) {
		movieStoryService.deleteReview(review_num);
		return "redirect:/member/mypage/moviestory";
	}
	
	@GetMapping("/member/mypage/deleteDibs")
	public String deleteDibs(String movieCode, @AuthenticationPrincipal Member member) {
		movieStoryService.deleteDibs(movieCode, member.getMEMBER_ID());
		
		return "redirect:/member/mypage/moviestory";
	}

}
