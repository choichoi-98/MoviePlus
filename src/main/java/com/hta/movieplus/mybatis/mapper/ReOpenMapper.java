package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;

@Mapper
public interface ReOpenMapper {

	public List<Movie> getEndedMovieList();
}
