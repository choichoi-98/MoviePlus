package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.domain.MovieReviewVO;

@Mapper
public interface MovieStoryMapper {

	List<MoviePostVO> getMoviePostListByMemberId(String memberId);

	List<Movie> getMovieDibsListByMemberId(String memberId);

	List<MovieReviewVO> getMovieReviewListByMemberId(String memberId);

}
