package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.ReOpenVO;

public interface ReOpenService {

	public List<Movie> getEndedMovieList();
	
	public void insertReOpenExpectMovieImformation(String movieCode);

	public List<ReOpenVO> getExpectMovieList();

	public void cancelreopen(String cancelcode);
	
	
	
	
	
	
	/*
	 * public List<Movie> getExpectReOpening();
	 */
}
