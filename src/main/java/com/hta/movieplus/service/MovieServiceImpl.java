package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MovieReviewVO;
import com.hta.movieplus.mybatis.mapper.MovieMapper;

@Service
public class MovieServiceImpl implements MovieService{

	private MovieMapper dao;
	
	@Autowired
	public MovieServiceImpl(MovieMapper dao) {
		this.dao = dao;
	}
	
	@Override	//영화 목록 삽입
	public int insert(Movie m) {
		return dao.insert(m);
	}

	@Override  //영화 list 
	public Movie select(String movieCd) {
		return dao.select(movieCd);
	}
	
	@Override //movie code select
	public List<String> getAllMovieCodes() {
		return dao.selectMovieCode();
	}

	@Override //출연배우 정보 update
	public int updateMovieActors(String movieCd, String actors, String watchGradeNm, String showTm) {
		return dao.updateActors(movieCd, actors, watchGradeNm, showTm);
	}

	@Override //MOVIE_TITLE, MOVIE_DIRECTOR select
	public List<Movie> getAllMovies() {
		return dao.selectMovieTitle();
	}

	@Override //줄거리, 포스터, 스틸 update
	public int updatePoster(String codeNo, String posterUrl, String stillUrl, String plotText) {
		return dao.updatePoster(codeNo, posterUrl,stillUrl, plotText);
		
	}

	@Override
	public List<Movie> getMovieListAll() {
		return dao.getMovieListAll();
	}
	
	

	//메인-로그인한 경우
	public List<Movie> getPlayingMovieLoginMain(String memberId) {
		return dao.getPlayingMovieLoginMain(memberId);
	}
	
	//메인-로그인 x
	public List<Movie> getPlayingMovieMain() {
		return dao.getPlayingMovieMain();
	}

	//영화 목록 - 로그인x, 검색
	public List<Movie> getPlayingMovie(String search_word) {
		return dao.getPlayingMovieList(search_word);
	}

	//영화 목록-로그인 한 경우 검색
	public List<Movie> getPlayingMovieLogin(String memberId, String search_word) {
		return dao.getPlayingMovieLogin(memberId, search_word);
	}

	//관리자 - 상영 중 영화 목록
	public List<Movie> getPlayingMovieAdmin() {
		return dao.getPlayingMovieListAdmin();
	}
	
	

	public List<Movie> getUpcomingMovie() {
		return dao.getUpcomingMovieList();
	}

	public List<Movie> getEndedMovie() {
		return dao.getEndedMovieList();
	}

	public int getListCount() {
		return dao.getListcount();
	}


	public List<Movie> getMovieListByPage(int page, int pageSize) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
	    int startrow = (page - 1) * pageSize + 1;
	    int endrow = startrow + pageSize - 1;
	    map.put("start", startrow);
	    map.put("end", endrow);
	    
		return dao.getMovieList(map);
	}

	public int moviePlayUpdate(String movieCode) {
		System.out.println(movieCode);
		return dao.moviePlayUpdate(movieCode);
	}

	public int movieEndedUpdate(String movieCode) {
		return dao.movieEndedUpdate(movieCode);
	}

	public int addMovieDibs(String memberId, String movieCode) {
		return dao.addMovieDibs(memberId, movieCode);
	}

	public int deleteMovieDibs(String memberId, String movieCode) {
		return dao.deleteMovieDibs(memberId, movieCode);
	}

	//로그인 한 경우 movieDetail
	public List<Movie> getMovieDetailLogin(String memberId, String movieCode) {
		// TODO Auto-generated method stub
		return dao.getMovieDetailLogin(memberId, movieCode);
	}

	//로그인 x 경우 movieDetail
	public List<Movie> getMovieDetail(String movieCode) {
		// TODO Auto-generated method stub
		return dao.getMovieDetail(movieCode);
	}
	
	//관람평(댓글) 추가
	public int addMovieReview(String memberId, String movieCode, String reviewText, int star) {
		// TODO Auto-generated method stub
		System.out.println(memberId+" "+movieCode+" "+ reviewText+ " "+ star);
		return dao.addMovieReview(memberId,movieCode,reviewText,star);
		
	}
	
	//관람평(댓글) list 가져오기
	public List<MovieReviewVO> getMovieReview(String movieCode) {
		// TODO Auto-generated method stub
		return dao.getMovieReview(movieCode);
	}

	//관람평(댓글) 수정
	public int updateMovieReview(String review_num, String reviewText, int star) {
		// TODO Auto-generated method stub
		return dao.updateMovieReview(review_num, reviewText, star);
	}
	

}
