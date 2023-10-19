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
import com.hta.movieplus.domain.MoviePostCommentVO;
import com.hta.movieplus.domain.MoviePostLikeVO;
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
	public String moviePostAllView(Model model, @AuthenticationPrincipal Member member) {
		List<Movie> movieList = moviePostService.getMovieWithPostCnt();
		int myPostCnt = -1;
		int totalCnt = moviePostService.getTotalCnt();
		if(member != null) {
			 myPostCnt = moviePostService.getMyPostCnt(member.getMEMBER_ID());
		}
		
		
		model.addAttribute("myPostCnt", myPostCnt);
		model.addAttribute("mp_movieList", movieList);
		model.addAttribute("totalCnt", totalCnt);
		
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
	
	@ResponseBody
	@PostMapping("/deletePost")
	public int deletePost(int postNum) {
		
		return moviePostService.deletePost(postNum);
	}

	@ResponseBody
	@PostMapping("/checkLike")
	public int checkLike(int MOVIEPOST_NUM, @AuthenticationPrincipal Member member) {
				
		if(member == null) {
			return -1;
			
		}
		return moviePostService.checkLike(MOVIEPOST_NUM, member);
	}
	
	@ResponseBody
	@PostMapping("/addLikeAction")
	public int addLikeAction(int MOVIEPOST_NUM, @AuthenticationPrincipal Member member) {
		
		
		return moviePostService.addLikeByPostNum(MOVIEPOST_NUM, member);
	}
	
	@ResponseBody
	@PostMapping("/deleteLikeAction")
	public int deleteLikeAction(int MOVIEPOST_NUM, @AuthenticationPrincipal Member member) {
		
		
		return moviePostService.deleteLikeByPostNum(MOVIEPOST_NUM, member);
	}
	
	@ResponseBody
	@PostMapping("/addMoviePostComment")
	public int addMoviePostComment(MoviePostCommentVO comment) {
		
		return moviePostService.addMoviePostComment(comment);
	}
	
	@ResponseBody
	@PostMapping("/getCommentList")
	public List<MoviePostCommentVO> getCommentList(int postNum){
		
		return moviePostService.getCommemtListByPostNum(postNum);
	}
	
	@ResponseBody
	@PostMapping("/deleteComment")
	public int deleteComment(int comment_num) {
		
		return moviePostService.deleteCommentByCommNum(comment_num);
	}
}
