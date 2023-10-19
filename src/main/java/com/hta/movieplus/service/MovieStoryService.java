package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.MovieDibsVO;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.domain.MovieReviewVO;

public interface MovieStoryService {

	List<MoviePostVO> getMoivePostList(String memberId);

	List<MovieDibsVO> getMovieDibsList(String memberId);

	List<MovieReviewVO> getMovieReviewList(String memberId);

}
