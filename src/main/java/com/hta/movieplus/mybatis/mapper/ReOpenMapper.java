package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

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

	public List<ReOpenVO> getReopenlistPagination(Map<String, Object> dataMap);

	public int getCountByReopen();

	public int getCountByEndMovieList();

	public List<Movie> getEndMovieListPagination(Map<String, Object> dataMap);
	 
}
