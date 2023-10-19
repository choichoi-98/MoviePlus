package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
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
	public List<MoviePostVO> getMoviePostList(String memberId) {
		// TODO Auto-generated method stub
		return mapper.getMoviePostListByMemberId(memberId);
	}

	@Override
	public List<Movie> getMovieDibsList(String memberId) {
		// TODO Auto-generated method stub
		List<Movie> list = mapper.getMovieDibsListByMemberId(memberId);
		
		for (Movie movie : list) {
			if (movie.getMovie_Poster().length() > 10) {
				movie.setMovie_Poster(movie.getMovie_Poster().substring(0, 60));
			}
		}
		
		return list;
	}

	@Override
	public List<MovieReviewVO> getMovieReviewList(String memberId) {
		// TODO Auto-generated method stub
		return mapper.getMovieReviewListByMemberId(memberId);
	}

}
