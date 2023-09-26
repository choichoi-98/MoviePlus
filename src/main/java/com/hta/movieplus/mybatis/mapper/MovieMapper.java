package com.hta.movieplus.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;

@Mapper
public interface MovieMapper {

	public int insert(Movie m);

	public Movie select(String movieCd);
	
}
