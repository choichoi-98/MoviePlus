package com.hta.movieplus.controller;

import java.util.List;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.service.MoviePostService;

@Controller
@RequestMapping("/moviepost")
public class MoviePostController {
	MoviePostService moviePostService;
	
	public MoviePostController(MoviePostService moviePostService) {
		// TODO Auto-generated constructor stub
		this.moviePostService = moviePostService;
	}
	
	
	@GetMapping("/all")
	public String moviePostAllView() {
		return "moviepost/moviepost_list";
	}
	
	@GetMapping("/selectMovie")
	public String selectMovieView(Model model, @AuthenticationPrincipal Member member) {
		List<Movie> movieList = moviePostService.getSeenMovieList(member.getMEMBER_NUM());
		
		model.addAttribute("mp_movieList", movieList);
		return "moviepost/moviepost_selectMovie";
		
	}
	
	@GetMapping("/write")
	public String movieWriteView(Model model, String movieCode) {
		Movie movie = moviePostService.getMovieByCode(movieCode);
		List<String> stillCutList = moviePostService.getStillCutByCode(movieCode);
		
		model.addAttribute("stillCutList", stillCutList);
		model.addAttribute("mp_movie", movie);
		return "moviepost/moviepost_write";
	}
	
	
	@GetMapping("/writeAction")
	public String moviePostWriteAction(MoviePostVO post, @AuthenticationPrincipal Member member) {
		post.setMember_Id(member.getMEMBER_ID());
		moviePostService.insert(post);
		
		return "redirect:/moviepost/all";
	}
	
	@ResponseBody
	@PostMapping("/getMoviePostListAjax")
	public List<MoviePostVO> getMoviePostList(String option, int index, String keyword){
		List<MoviePostVO> list = moviePostService.getMoviePostList(option, index, keyword);
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("/getPostDetail")
	public MoviePostVO getPostDetail(int postNum){
		
		return moviePostService.getPostDetail(postNum); 
	}
	
}
