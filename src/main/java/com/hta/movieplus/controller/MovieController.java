package com.hta.movieplus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hta.movieplus.api.RestApi.MovieDetailApi;
import com.hta.movieplus.api.RestApi.MoviePosterApi;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.service.MovieServiceImpl;

@Controller
@RequestMapping(value = "/movie")
public class MovieController {

	@Autowired
	private MovieServiceImpl movieServiceImpl;
	
	@Autowired
	private MovieDetailApi movieDetailApi;
	
	@Autowired
	private MoviePosterApi moviePosterApi;
	
    private static final Logger logger = LoggerFactory.getLogger(MovieController.class);
	
    @GetMapping("/movieListPage") //영화 > 전체 영화 list
    public String movieList() {
    	return "movie/movie_list";
    }
    
    @GetMapping("/movieAdd")
    public String movieAdd() {
    	return "admin/movie_add";
    }
    
    @ResponseBody
	@GetMapping("/updateActors")
	public void updateActors(HttpServletRequest request, Model model) {
		//MovieServieImpl을 사용해서 DB에 저장된 모든 MOVIE_CODE 값 가져옴
		List<String> allMovieCodes = movieServiceImpl.getAllMovieCodes();
		
		//가져온 모든 MOVIE_CODE에 대해 출연배우 정보를 업데이트
		for(String movieCode : allMovieCodes) {
			movieDetailApi.updateMovieActors(movieCode);
			logger.info("출연배우 정보 업데이트 성공 - Movie Code: {]" + movieCode.toString());
		}
		
	}
	
//	@ResponseBody
//	@RequestMapping("/updatePoster")
//	public void updatePoster(HttpServletRequest request, Model model) throws Exception {
//		//MovieServiceImpl을 사용하여 DB에 저장된 MOVIE_TITLE, MOVIE_DIRECTOR 값 가져옴
//		 List<Movie> movies = movieServiceImpl.getAllMovies(); 
//	     logger.info("movies=" + movies.toString()); 
//		 
//		 for(Movie  movie : movies) {
//			 String movieTitle = movie.getMovie_Title();
//			 String movieDirector = movie.getMovie_Director();
//			 if (movieDirector == null) {
//				 movieDirector = " ";
//			 }
//			 //TestMoviePosterApi.moviePosterApi(movieTitle, movieDirector);
//			 logger.info("여기는 MovieController의 updatePoster");
//		 }
//	      
//		
//	}
	
	@ResponseBody
	@RequestMapping(value="/movieListAll")
	public List<Movie> getMovieListAll( ){
		 List<Movie> movieList = movieServiceImpl.getMovieListAll();
		 Map<String,Object> map = new HashMap<String,Object>();
		 map.put("movieList", movieList);
		 logger.info(movieList.size() + "");
		 return movieList;
	}

	@ResponseBody
	@RequestMapping(value="/movieListAllModal")
	public Map<String, Object> getMovieListAll
						(@RequestParam(name = "page", defaultValue = "1") int page
	                    ) {
	    Map<String, Object> response = new HashMap<>();

	    int limit = 20;
	    
	    // 전체 영화 목록을 가져오는 대신, 해당 페이지의 데이터만 가져오도록 서비스 계층 호출
	    List<Movie> movieList = movieServiceImpl.getMovieListByPage(page, limit);
	    logger.info("무비리스트모달:"+movieList.size() + "");
	    // 전체 영화 개수
	    int listcount = movieServiceImpl.getListCount();

	    int maxpage = (listcount + limit - 1) / limit;
	    int startpage = ((page - 1) / 20) * 20 + 1;
	    int endpage = startpage + 20 - 1;
	    if (endpage > maxpage)
	         endpage = maxpage;
	    System.out.println("startpage="+startpage);
	    System.out.println("endpage="+endpage);

	    response.put("movieList", movieList);
	    response.put("page", page);
	    response.put("maxpage", maxpage);
	    response.put("startpage", startpage);
	    response.put("endpage", endpage);
	    response.put("listcount", listcount);
	    response.put("limit", limit);

	    return response;
	}

	@ResponseBody
	@RequestMapping(value="/now-playing")
	public List<Movie> getPlayingMovie(){
		return movieServiceImpl.getPlayingMovie();
	}
	
	@ResponseBody
	@RequestMapping(value="/ended")
	public List<Movie> getEndedMovie(){
		return movieServiceImpl.getEndedMovie();
	}

	@ResponseBody
	@RequestMapping(value="/moviePlayUpdate")
	public String moviePlayUpdate(@RequestParam("movieCode") String movieCode){
		return movieServiceImpl.moviePlayUpdate(movieCode);
	}

	@ResponseBody
	@RequestMapping(value="/movieEndedUpdate")
	public String movieEndedUpdate(@RequestParam("movieCode") String movieCode){
		return movieServiceImpl.movieEndedUpdate(movieCode);
	}
	
}

