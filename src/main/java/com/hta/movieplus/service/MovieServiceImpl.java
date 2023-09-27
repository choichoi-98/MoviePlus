package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.mybatis.mapper.MovieMapper;

@Service
public class MovieServiceImpl implements MovieService{

	private MovieMapper dao;
	
	@Autowired
	public MovieServiceImpl(MovieMapper dao) {
		this.dao = dao;
	}
	
	@Override	//영화 목록 삽입
	public int insert(Movie m) {
		return dao.insert(m);
	}

	@Override  //영화 list 
	public Movie select(String movieCd) {
		return dao.select(movieCd);
	}
	
	@Override //movie code select
	public List<String> getAllMovieCodes() {
		return dao.selectMovieCode();
	}

	@Override //출연배우 정보 update
	public int updateMovieActors(String movieCd, String actors) {
		return dao.updateActors(movieCd, actors);
	}
	
	

}
