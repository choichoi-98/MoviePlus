package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.MovieDibsVO;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.domain.MovieReviewVO;
import com.hta.movieplus.mybatis.mapper.MovieStoryMapper;

@Service
public class MovieStoryServiceImpl implements MovieStoryService {

	MovieStoryMapper mapper;
	
	@Autowired
	public MovieStoryServiceImpl(MovieStoryMapper mapper) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}
	
	@Override
	public List<MoviePostVO> getMoivePostList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MovieDibsVO> getMovieDibsList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MovieReviewVO> getMovieReviewList(String memberId) {
		// TODO Auto-generated method stub
		return null;
	}

}
