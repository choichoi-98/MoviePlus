package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Movie;

public interface MovieService {

	public int insert(Movie m);
	
	public Movie select(String movieCd);
	
	public List<String> getAllMovieCodes();

	public int updateMovieActors(String movieCd, String actors, String watchGradeNm, String showTm);
	
	public List<Movie> getAllMovies();
	
	public int updatePoster(String codeNo, String posterUrl, String stillUrl, String plotText);
	
	public int getListCount();

	public List<Movie> getMovieListAll();
	
	public List<Movie> getMovieListByPage(int page, int pageSize);
	
	public int moviePlayUpdate(String movieCode);
	
	public int movieEndedUpdate(String movieCode);
	
	public int addMovieDibs(String memberId, String movieCode);
	
	public int deleteMovieDibs(String memberId, String movieCode);
	
	//
	
	public double getAvgReviewPoint(String movieCode);

	public int getTotalAudience(String movieCode);
	
}
