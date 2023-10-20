package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;

@Mapper
public interface ReopenUserMapper {

	List<Movie> getReopenMovieList();

	int findByMap(Map<String, Object> map);

	void insert(Map<String, Object> map);

	Movie findByMovieCode(String movieCode);

}
