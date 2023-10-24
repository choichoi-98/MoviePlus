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
		
		if(dao.insertReOpenExpectMovieImformation(movieCode) > 0) {
			dao.updateExpectReOpening(movieCode);
		}
	}

	@Override
	public List<ReOpenVO> getExpectMovieList() {
		return dao.getExpectMovieList();
	}

	@Override
	public void cancelReOpen(String cancelcode) {
		
		if(dao.cancelReOpen(cancelcode) > 0) {
			dao.updateReOpenCancel(cancelcode);
		}
		
	}

	/*
	 * @Override public void updateReOpenCancel(String reopencancel) {
	 * dao.updateReOpenCancel(reopencancel); }
	 */
	
	
	
}
