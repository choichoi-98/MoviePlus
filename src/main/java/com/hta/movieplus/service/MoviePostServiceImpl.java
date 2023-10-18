package com.hta.movieplus.service;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.mybatis.mapper.MoviePostMapper;

@Service
public class MoviePostServiceImpl implements MoviePostService {
	MoviePostMapper mapper;

	public MoviePostServiceImpl(MoviePostMapper mapper) {
		this.mapper = mapper;
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Movie> getSeenMovieList(int member_NUM) {
		// TODO Auto-generated method stub
		List<Movie> movieList = mapper.getSeenMovieList(member_NUM);

		for (Movie movie : movieList) {
			if (movie.getMovie_Poster().length() >= 60) {
				movie.setMovie_Poster(movie.getMovie_Poster().substring(0, 60));
			}
		}

		return movieList;
	}

	@Override
	public Movie getMovieByCode(String movieCode) {
		// TODO Auto-generated method stub

		return mapper.getMovieByCode(movieCode);
	}

	@Override
	public List<String> getStillCutByCode(String movieCode) {
		// TODO Auto-generated method stub
		Movie movie = mapper.getMovieByCode(movieCode);
		List<String> list = new ArrayList<String>();
		
		StringTokenizer st = new StringTokenizer(movie.getMovie_Still(), "|");
		
		while(st.hasMoreTokens()) {
			list.add(st.nextToken());
		}
		
		
		return list;
	}

	@Override
	public void insert(MoviePostVO post) {
		// TODO Auto-generated method stub
		mapper.insert(post);
	}

}
