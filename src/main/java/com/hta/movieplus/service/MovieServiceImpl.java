package com.hta.movieplus.service;

import java.util.HashMap;
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
	public int updateMovieActors(String movieCd, String actors, String watchGradeNm, String showTm) {
		return dao.updateActors(movieCd, actors, watchGradeNm, showTm);
	}

	@Override //MOVIE_TITLE, MOVIE_DIRECTOR select
	public List<Movie> getAllMovies() {
		return dao.selectMovieTitle();
	}

	@Override //줄거리, 포스터, 스틸 update
	public int updatePoster(String codeNo, String posterUrl, String stillUrl, String plotText) {
		return dao.updatePoster(codeNo, posterUrl,stillUrl, plotText);
		
	}

	@Override
	public List<Movie> getMovieListAll() {
		return dao.getMovieListAll();
	}

	public List<Movie> getPlayingMovie() {
		return dao.getPlayingMovieList();
	}

	public List<Movie> getUpcomingMovie() {
		return dao.getUpcomingMovieList();
	}

	public List<Movie> getEndedMovie() {
		return dao.getEndedMovieList();
	}

	public int getListCount() {
		return dao.getListcount();
	}


	public List<Movie> getMovieListByPage(int page, int pageSize) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
	    int startrow = (page - 1) * pageSize + 1;
	    int endrow = startrow + pageSize - 1;
	    map.put("start", startrow);
	    map.put("end", endrow);
	    
		return dao.getMovieList(map);
	}

	public int moviePlayUpdate(String movieCode) {
		System.out.println(movieCode);
		return dao.moviePlayUpdate(movieCode);
	}

	public int movieEndedUpdate(String movieCode) {
		return dao.movieEndedUpdate(movieCode);
	}





	
	

}
