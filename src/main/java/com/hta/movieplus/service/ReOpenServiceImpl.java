package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.ReOpenVO;
import com.hta.movieplus.mybatis.mapper.ReOpenMapper;

@Service
public class ReOpenServiceImpl implements ReOpenService {

	ReOpenMapper dao;
	
	@Autowired
	public ReOpenServiceImpl(ReOpenMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<Movie> getEndedMovieList() {
		return dao.getEndedMovieList();
	}
	
	@Override
	public void insertReOpenExpectMovieImformation(String movieCode) {
		dao.insertReOpenExpectMovieImformation(movieCode);
	}

	@Override
	public void updateExpectReOpening(String code) {
		dao.updateExpectReOpening(code);
	}



	  
	/*
	 * @Override public List<Movie> getExpectReOpening() { return
	 * dao.getExpectReOpening(); }
	 */
	
	
}
