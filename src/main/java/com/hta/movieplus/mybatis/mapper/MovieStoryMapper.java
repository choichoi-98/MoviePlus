package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.domain.MovieReviewVO;
import com.hta.movieplus.domain.StorePayVO;
import com.hta.movieplus.domain.TheaterSchedule;

@Mapper
public interface MovieStoryMapper {

	List<MoviePostVO> getMoviePostListByMemberId(String memberId);

	List<Movie> getMovieDibsListByMemberId(String memberId);

	List<MovieReviewVO> getMovieReviewListByMemberId(String memberId);

	void deleteDibs(Map<String, Object> map);

	List<TheaterSchedule> getScheduleListByMemberId(String memberId);

	List<TheaterSchedule> getBookedList(String memberId);

	List<StorePayVO> getStoreList(String memberId);

}
