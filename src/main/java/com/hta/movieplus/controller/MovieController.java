package com.hta.movieplus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.api.RestApi.MovieDetailApi;
import com.hta.movieplus.api.RestApi.MoviePosterApi;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MovieReviewVO;
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
    public ModelAndView movieList(ModelAndView mv,
    		@AuthenticationPrincipal Member member,
    				@RequestParam(value="search_word", defaultValue="", required=false) String search_word) throws Exception {
    	
    	
    	
    	if(member != null) {
    		String memberId =  member.getMEMBER_ID();
    		List<Movie> movieList = movieServiceImpl.getPlayingMovieLogin(memberId,search_word);
    		mv.addObject("movieList",movieList);
    		mv.addObject("search_word", search_word);
    		
    	} else {
    		List<Movie> movieList = movieServiceImpl.getPlayingMovie(search_word);
    		mv.addObject("movieList",movieList);
    		mv.addObject("search_word", search_word);
    	}
    	
    	mv.setViewName("movie/movie_list");
    	
    	return mv;
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

	    int limit = 100;
	    
	    // 전체 영화 목록을 가져오는 대신, 해당 페이지의 데이터만 가져오도록 서비스 계층 호출
	    List<Movie> movieList = movieServiceImpl.getMovieListByPage(page, limit);
	    logger.info("무비리스트모달:"+movieList.size() + "");
	    // 전체 영화 개수
	    int listcount = movieServiceImpl.getListCount();

	    int maxpage = (listcount + limit - 1) / limit;
	    int startpage = ((page - 1) / 100) * 100 + 1;
	    int endpage = startpage + 100 - 1;
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
	public List<Movie> getPlayingMovie(
			){
		
			return movieServiceImpl.getPlayingMovieAdmin();
	}

	
	@ResponseBody
	@RequestMapping(value="/ended")
	public List<Movie> getEndedMovie(){
		return movieServiceImpl.getEndedMovie();
	}

	@ResponseBody
	@RequestMapping(value="/moviePlayUpdate")
	public void moviePlayUpdate(@RequestParam("movieCode") String movieCode){
		System.out.println("movieCode: " + movieCode);
		 movieServiceImpl.moviePlayUpdate(movieCode);
	}

	@ResponseBody
	@RequestMapping(value="/movieEndedUpdate")
	public void movieEndedUpdate(@RequestParam("movieCode") String movieCode){
		 movieServiceImpl.movieEndedUpdate(movieCode);
	}
	
    @GetMapping("/movieDetail")
    public ModelAndView movieDetail(ModelAndView mv,
    				@RequestParam(value="movieCode", defaultValue="") String movieCode,
    				@AuthenticationPrincipal Member member
    		) {
    	
    	if(member != null) {
    		String memberId =  member.getMEMBER_ID();
    		List<Movie> movieDetail = movieServiceImpl.getMovieDetailLogin(memberId, movieCode);
    		mv.addObject("movieDetail", movieDetail);
    	} else {
    		List<Movie> movieDetail = movieServiceImpl.getMovieDetail(movieCode);
    		mv.addObject("movieDetail", movieDetail);
    	}
    	
    	mv.setViewName("movie/movie_detail");
    	return mv;
    }
	
	
	//관람평(댓글) 화면 표시
	@ResponseBody
	@RequestMapping(value="/getMovieReview")
	public List<MovieReviewVO> getMovieReview(
				
				@RequestParam("movieCode") String movieCode
			){
		logger.info("관람평 moviecode:"+ movieCode);
		List<MovieReviewVO> movieReviews = movieServiceImpl.getMovieReview(movieCode);
//		 for (MovieReviewVO review : movieReviews) {
//		        System.out.println("Review ID: " + review.getMember_Id());
//		        System.out.println("Review content: " + review.getMovie_Review_content());
//		    }
//		
		return movieReviews;
		
	}
	
	
	//관람평(댓글) 추가
	@ResponseBody
	@RequestMapping(value="/addMovieReview")
	public int addMovieReview(
			@RequestParam("movieCode") String movieCode,
			@RequestParam("memberId") String memberId,
			@RequestParam("reviewText") String reviewText,
			@RequestParam("movieStar")  String movieStar
			){
		
	        int star = Integer.parseInt(movieStar);
		
		return movieServiceImpl.addMovieReview(memberId, movieCode,reviewText,star);
		
	}
	
	//관람평(댓글) 수정
	@ResponseBody
	@RequestMapping(value="modifyReview")
	public int modifyReview(
			@RequestParam("review_num") String review_num,
			@RequestParam("reviewText") String reviewText,
			@RequestParam("movieStar") String movieStar
			) {
		
		int star = Integer.parseInt(movieStar);
		
		return movieServiceImpl.updateMovieReview(review_num,reviewText,star);
	}

	//관람평(댓글) 삭제
	@ResponseBody
	@RequestMapping(value="deleteReview")
	public int deleteReview(
			@RequestParam("review_num") String review_num
			) {
		
		return movieServiceImpl.deleteMovieReview(review_num);
	}
	
	//관람평(댓글) 좋아요 추가
	@ResponseBody
	@RequestMapping(value="/addMovieReviewLike")
	public int addMovieReviewLike(
				@RequestParam("review_num") int review_num,
				@RequestParam("loginId") String memberId 
			) {
		
		
		return movieServiceImpl.addMovieReviewLike(memberId, review_num);
	}
	
	//관람평(댓글) 좋아요 삭제
//	@ResponseBody
//	@RequestMapping("/deleteMovieReviewLike")
//	public int deleteMovieReviewLike(
//			@RequestParam("review_num") String review_num,
//			@AuthenticationPrincipal Member member) {
//		
//		String memberId = member.getMEMBER_ID();
//		
//		return movieServiceImpl.deleteMovieReviewLike(memberId, review_num);
//	}
//	
	
	//보고싶어요 추가
	@ResponseBody
	@RequestMapping(value="/addMovieDibs")
	public Map<String, Object> addMovieDibs(
			@RequestParam("movieCode") String movieCode,
			@AuthenticationPrincipal Member member
			) {
		Map<String,Object> map = new HashMap<String,Object>();
	    
	    if (member != null) {
	    	String memberId =  member.getMEMBER_ID();
	        movieServiceImpl.addMovieDibs(memberId, movieCode);
	        map.put("alert", false);
	        boolean alertValue = (boolean) map.get("alert");
	        logger.info("alert 값=" + alertValue);
	        
	    } else {
	        // alert 표시 
	        map.put("alert", true);
	    }
	    
	    return map;
	}
	
	//보고싶어요 삭제
	@ResponseBody
	@RequestMapping(value="/deleteMovieDibs")
	public Map<String, Object> deleteMovieDibs(
			@RequestParam("movieCode") String movieCode,
			@AuthenticationPrincipal Member member
			) {
		Map<String,Object> map = new HashMap<String,Object>();
		
	    
	    if (member != null) {
	    	String memberId =  member.getMEMBER_ID();
	        movieServiceImpl.deleteMovieDibs(memberId, movieCode);
	        map.put("alert", false);
	    } else {
	        // alert 표시 
	        map.put("alert", true);
	    }
	    return map;
	}
}

