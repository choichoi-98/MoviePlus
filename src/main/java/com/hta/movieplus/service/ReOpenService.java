package com.hta.movieplus.service;

import java.util.List;
import java.util.Map;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.ReOpenVO;

public interface ReOpenService {

	public List<Movie> getEndedMovieList();
	
	public void insertReOpenExpectMovieImformation(String movieCode);

	public List<ReOpenVO> getExpectMovieList();

	public void cancelReOpen(String cancelcode);

	public Map<String, Object> pagination(int page, String option);

	public List<ReOpenVO> getReopenlistPagination(int page, int limit);

	public int getCountByReopen();

	public int getCountByEndMovieList();

	public List<Movie> getEndMovieListPagination(int page, int i);

	
	
	
	
	
}
