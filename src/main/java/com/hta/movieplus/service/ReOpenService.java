package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.ReOpenVO;

public interface ReOpenService {

	public List<Movie> getEndedMovieList();
	
	public void insertReOpenExpectMovieImformation(String movieCode);
	
	public void updateExpectReOpening(String code);
	
	
	
	
	
	
	/*
	 * public List<Movie> getExpectReOpening();
	 */
}
