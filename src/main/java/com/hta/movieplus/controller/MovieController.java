package com.hta.movieplus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hta.movieplus.api.RestApi.MovieDetailApi;
import com.hta.movieplus.service.MovieServiceImpl;

@Controller
@RequestMapping(value = "/movie")
public class MovieController {

	@Autowired
	private MovieServiceImpl movieServiceImpl;
	
	@Autowired
	private MovieDetailApi movieDetailApi;
	
    private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
    @GetMapping("/movieList")
    public String movieList() {
    	return "movie/movie_list";
    }
    
	@GetMapping("/updateActors")
	public void updateActors(HttpServletRequest request, Model model) {
		//MovieServieImpl을 사용해서 DB에 저장된 모든 MOVIE_CODE 값 가져옴
		List<String> allMovieCodes = movieServiceImpl.getAllMovieCodes();
		
		//가져온 모든 MOVIE_CODE에 대해 출연배우 정보를 업데이트
		for(String movieCode : allMovieCodes) {
			movieDetailApi.updateMovieActors(movieCode);
			logger.info("출연배우 정보 업데이트 성공 - Movie Code: {]", movieCode);
		}
		
	}
	
	
}

