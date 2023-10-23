package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.ReOpenVO;

@Mapper
public interface ReOpenMapper {

	public List<Movie> getEndedMovieList();
	
	public void insertReOpenExpectMovieImformation(String movieCode);
	
	public void updateExpectReOpening(String code);
	
	
	
	/*
	 * 
	 * 
	 * public void updateExpectDate(String startday);
	 * 
	 * public List<Movie> getExpectReOpening();
	 */
}
