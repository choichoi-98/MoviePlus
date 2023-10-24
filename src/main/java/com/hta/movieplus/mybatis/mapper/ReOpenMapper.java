package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.ReOpenVO;

@Mapper
public interface ReOpenMapper {

	public List<Movie> getEndedMovieList();
	
	public int insertReOpenExpectMovieImformation(String movieCode);
	
	public int updateExpectReOpening(String code);
	
	public List<ReOpenVO> getExpectMovieList();
	
	public int cancelReOpen(String cancelcode);
	
	public int updateReOpenCancel(String cancelcode);
	 
}
