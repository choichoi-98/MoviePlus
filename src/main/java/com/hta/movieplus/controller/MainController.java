package com.hta.movieplus.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView Main( ModelAndView mv) {
		
		List<Movie> movieList = movieServiceImpl.getPlayingMovie();
		
//		for (Movie movie : movieList) {
//	        System.out.println("Movie Code: " + movie.getMovie_Code());
//	        System.out.println("Movie Title: " + movie.getMovie_Title());
//	        System.out.println("Movie dibs: " + movie.getMOVIE_DIBS_OBJECT());
//	        System.out.println("--------------------------");
//		}
		
		
		mv.addObject("movieList", movieList);
		
		return mv;
	}
	

	
	
}
