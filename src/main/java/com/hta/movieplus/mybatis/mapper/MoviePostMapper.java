package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;

@Mapper
public interface MoviePostMapper {

	List<Movie> getSeenMovieList(int member_NUM);

	Movie getMovieByCode(String movieCode);

	void insert(MoviePostVO post);

}
