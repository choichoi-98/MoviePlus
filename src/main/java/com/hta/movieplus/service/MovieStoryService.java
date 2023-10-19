package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.domain.MovieReviewVO;

public interface MovieStoryService {

	List<MoviePostVO> getMoviePostList(String memberId);

	List<Movie> getMovieDibsList(String memberId);

	List<MovieReviewVO> getMovieReviewList(String memberId);

}
