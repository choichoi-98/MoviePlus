package com.hta.movieplus.service;

import com.hta.movieplus.domain.Movie;

public interface MovieService {

	public int insert(Movie m);
	
	public Movie select(String movieCd);
	
	
}
