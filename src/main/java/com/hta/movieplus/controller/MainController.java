package com.hta.movieplus.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.service.MovieServiceImpl;


@Controller
public class MainController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	private MovieServiceImpl movieServiceImpl;
	
	@Autowired
	public MainController(MovieServiceImpl movieServiceImpl) {
		this.movieServiceImpl = movieServiceImpl;
	}
	
	
	@RequestMapping("/main")
	public ModelAndView Main( ModelAndView mv
							, HttpSession session) throws Exception{

		logger.info("main");
		
		Member memberInfo = (Member) session.getAttribute("memberInfo");
		if (memberInfo != null) { //로그인 한 경우
		       String memberId = memberInfo.getMEMBER_ID();
		       System.out.println(memberId);
		       logger.info("로그인 한 경우 메인"+memberId);
	        List<Movie> movieList = movieServiceImpl.getPlayingMovieLoginMain(memberId);
	        mv.addObject("movieList", movieList);
	        
	    } else {
	        List<Movie> movieList = movieServiceImpl.getPlayingMovieMain();
	        mv.addObject("movieList", movieList);
	    }

	    return mv;
	}
	

	
	
}
