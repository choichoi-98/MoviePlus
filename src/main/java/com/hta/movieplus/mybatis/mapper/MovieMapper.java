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
	public List<Movie> getPlayingMovieList(String search_word, String THEATER_SCHEDULE_DATE);
	//일반
	public List<Movie> getPlayingMovieLogin(String memberId, String search_word, String THEATER_SCHEDULE_DATE);

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

	public List<Movie> getPlayingMovieMain(String THEATER_SCHEDULE_DATE);

	public List<Movie> getPlayingMovieLoginMain(String memberId, String THEATER_SCHEDULE_DATE);
	
	//로그인 o 영화 상세
	public List<Movie> getMovieDetailLogin(String memberId, String movieCode);

	//로그인 x 영화 상세
	public List<Movie> getMovieDetail(String movieCode);
	

	//관람평(댓글) 가져오기
	public List<MovieReviewVO> getMovieReview(String movieCode);
	
	//관람평(댓글) 등록
	public int addMovieReview(String memberId, String movieCode, String reviewText, int star);

	//관람평(댓글) 수정
	public int updateMovieReview(String review_num, String reviewText, int star);

	//관람평(댓글) 삭제
	public int deleteMovieReview(String review_num);

	//관람평(댓글) 좋아요 등록
	public int addMoviewReviewLike(String memberId, int review_num);

	//관람평(댓글) 좋아요 삭제
	public int deleteMovieReviewLike(String memberId, String review_num);

	//관리자-관람평(댓글) list 
	public List<MovieReviewVO> adminMovieReviewList(HashMap<String, Integer> map);
	
	//관리자-관람평 count
	public int adminMovieReviewListCnt();

	//관리자-관람평 삭제
	public int adminDeleteMovieReview(int review_num);

	//누적관객수 가져오기
	public int getTotalAudience(String movieCode);

	public List<Movie> getMovieCodeTotal(String THEATER_SCHEDULE_DATE, String movieCode);

	public List<Movie> getViewerCount(String THEATER_SCHEDULE_DATE, String movieCode);
	
	//전체 영화 갯수 
	public int getMovieAllCount();

	//상영 중인 영화 갯수 
	public int moviePlayingCount();

	//상영 종료 영화 갯수 
	public int movieEndedCount();




}

