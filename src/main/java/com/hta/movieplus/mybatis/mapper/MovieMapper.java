package com.hta.movieplus.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MovieReviewVO;

@Mapper
public interface MovieMapper {

	public int insert(Movie m);

	public Movie select(String movieCd);

	public List<String> selectMovieCode();

	public int updateActors(String movieCd, String actors, String watchGradeNm, String showTm);

	public List<Movie> selectMovieTitle();

	public int updatePoster(String codeNo, String posterUrl, String stillUrl, String plotText);

	public List<Movie> getMovieListAll();

	//일반
	public List<Movie> getPlayingMovieList(String search_word);
	//일반
	public List<Movie> getPlayingMovieLogin(String memberId, String search_word);

	//관리자
	public List<Movie> getPlayingMovieListAdmin();

	public List<Movie> getUpcomingMovieList();

	public List<Movie> getEndedMovieList();

	public int getListcount();

	public List<Movie> getMovieList(HashMap<String, Integer> map);

	public int moviePlayUpdate(String movieCode);

	public int movieEndedUpdate(String movieCode);

	public int addMovieDibs(String memberId, String movieCode);

	public int deleteMovieDibs(String memberId, String movieCode);

	public List<Movie> getPlayingMovieMain();

	public List<Movie> getPlayingMovieLoginMain(String memberId);

	public List<Movie> getMovieDetailLogin(String memberId, String movieCode);

	public List<Movie> getMovieDetail(String movieCode);
	

	//관람평(댓글) 가져오기
	public List<MovieReviewVO> getMovieReview(String movieCode);
	
	//관람평(댓글) 등록
	public int addMovieReview(String memberId, String movieCode, String reviewText, int star);


}

