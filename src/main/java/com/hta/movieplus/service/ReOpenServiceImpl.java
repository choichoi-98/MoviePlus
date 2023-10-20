package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.mybatis.mapper.ReOpenMapper;

@Service
public class ReOpenServiceImpl implements ReOpenService {

	ReOpenMapper dao;
	
	@Autowired
	public ReOpenServiceImpl(ReOpenMapper dao) {
		// TODO Auto-generated constructor stub
		this.dao = dao;
	}

	@Override
	public List<Movie> getEndedMovieList() {
		return dao.getEndedMovieList();
	}

}
