package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;

@Mapper
public interface MoviePostMapper {

	List<Movie> getSeenMovieList(int member_NUM);

	Movie getMovieByCode(String movieCode);

	void insert(MoviePostVO post);

	List<MoviePostVO> getMoviePostList(Map<String, Object> dataMap);

	MoviePostVO getPostDetail(int postNum);

	List<Movie> getMovieWithPostCnt();

	int getTotalCount();

	int getMyPostCnt(String mEMBER_ID);

}
