package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Movie;

public interface ReOpenService {

	public List<Movie> getEndedMovieList();
	
	public void updateExpectReOpening(String xxx);
	
	public List<Movie> getExpectReOpening();
}
