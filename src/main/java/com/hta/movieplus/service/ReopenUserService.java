package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Movie;

public interface ReopenUserService {

	List<Movie> getReopenMovieList();

	Movie getDetailReopenMovie(String movieCode);

	String admitReopen(String member_ID, String MOVIE_CODE);

}
