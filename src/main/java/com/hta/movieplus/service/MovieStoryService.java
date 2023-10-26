package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.domain.MovieReviewVO;
import com.hta.movieplus.domain.StorePayVO;
import com.hta.movieplus.domain.TheaterSchedule;

public interface MovieStoryService {

	List<MoviePostVO> getMoviePostList(String memberId);

	List<Movie> getMovieDibsList(String memberId);

	List<MovieReviewVO> getMovieReviewList(String memberId);

	void deleteReview(String review_num);

	void deleteDibs(String movieCode, String member_ID);

	List<TheaterSchedule> getScheduleList(String memberId);

	void deletePost(int post_num);

	List<TheaterSchedule> getBookedList(String memberId);

	List<StorePayVO> getStoreList(String memberId);

}
