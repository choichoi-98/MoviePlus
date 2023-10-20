package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.mybatis.mapper.MovieMapper;
import com.hta.movieplus.mybatis.mapper.ReopenUserMapper;

@Service
public class ReopenUserServiceImpl implements ReopenUserService {

	ReopenUserMapper reopenUserMapper;

	@Autowired
	public ReopenUserServiceImpl(ReopenUserMapper reopenUserMapper) {
		// TODO Auto-generated constructor stub
		this.reopenUserMapper = reopenUserMapper;
	}

	@Override
	public List<Movie> getReopenMovieList() {
		// TODO Auto-generated method stub

		List<Movie> movieList = reopenUserMapper.getReopenMovieList();

		for (Movie movie : movieList) {
			if (movie.getMovie_Poster().length() > 10) {
				movie.setMovie_Poster(movie.getMovie_Poster().substring(0, 60));

			}
		}

		return movieList;
	}

	@Override
	public Movie getDetailReopenMovie(String movieCode) {
		// TODO Auto-generated method stub
		String temp = "";
		Movie movie = reopenUserMapper.findByMovieCode(movieCode);

		if (movie.getMovie_Poster().length() >= 60) {
			temp = movie.getMovie_Poster().substring(0, 60).replace("/thm/02/", "/poster/").replace("/tn_", "/").replace(".jpg", "_01.jpg");
						
			movie.setMovie_Poster(temp);
		}
		
		

		return movie;
	}

	@Override
	public String admitReopen(String member_ID, String MOVIE_CODE) {
		// TODO Auto-generated method stub
		String result = "";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", member_ID);
		map.put("movieCode", MOVIE_CODE);
		
		if(reopenUserMapper.findByMap(map) > 0) {
			result = "fail";
		}else {
			reopenUserMapper.insert(map);
			result = "success";
		}
			
		return result;
	}

}
