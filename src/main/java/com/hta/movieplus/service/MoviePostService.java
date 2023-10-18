package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;

public interface MoviePostService {

	List<Movie> getSeenMovieList(int member_NUM);

	Movie getMovieByCode(String movieCode);

	List<String> getStillCutByCode(String movieCode);

	void insert(MoviePostVO post);

}
