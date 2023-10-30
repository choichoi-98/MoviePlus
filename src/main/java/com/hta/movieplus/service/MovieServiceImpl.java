package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MovieReviewVO;
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
	
	

	//메인-로그인한 경우
	public List<Movie> getPlayingMovieLoginMain(String memberId, String date) {
		return dao.getPlayingMovieLoginMain(memberId, date);
	}
	
	//메인-로그인 x
	public List<Movie> getPlayingMovieMain(String currentdate) {
		return dao.getPlayingMovieMain(currentdate);
	}

	//영화 목록 - 로그인x, 검색
	public List<Movie> getPlayingMovie(String search_word) {
		return dao.getPlayingMovieList(search_word);
	}

	//영화 목록-로그인 한 경우 검색
	public List<Movie> getPlayingMovieLogin(String memberId, String search_word) {
		return dao.getPlayingMovieLogin(memberId, search_word);
	}

	//관리자 - 상영 중 영화 목록
	public List<Movie> getPlayingMovieAdmin() {
		return dao.getPlayingMovieListAdmin();
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

	public int addMovieDibs(String memberId, String movieCode) {
		return dao.addMovieDibs(memberId, movieCode);
	}

	public int deleteMovieDibs(String memberId, String movieCode) {
		return dao.deleteMovieDibs(memberId, movieCode);
	}

	//로그인 한 경우 movieDetail
	public List<Movie> getMovieDetailLogin(String memberId, String movieCode) {
		// TODO Auto-generated method stub
		return dao.getMovieDetailLogin(memberId, movieCode);
	}

	//로그인 x 경우 movieDetail
	public List<Movie> getMovieDetail(String movieCode) {
		// TODO Auto-generated method stub
		return dao.getMovieDetail(movieCode);
	}
	
	//관람평(댓글) 추가
	public int addMovieReview(String memberId, String movieCode, String reviewText, int star) {
		// TODO Auto-generated method stub
		System.out.println(memberId+" "+movieCode+" "+ reviewText+ " "+ star);
		return dao.addMovieReview(memberId,movieCode,reviewText,star);
		
	}
	
	//관람평(댓글) list 가져오기
	public List<MovieReviewVO> getMovieReview(String movieCode) {
		// TODO Auto-generated method stub
		return dao.getMovieReview(movieCode);
	}

	//관람평(댓글) 수정
	public int updateMovieReview(String review_num, String reviewText, int star) {
		// TODO Auto-generated method stub
		return dao.updateMovieReview(review_num, reviewText, star);
	}

	//관람평(댓글) 삭제
	public int deleteMovieReview(String review_num) {
		// TODO Auto-generated method stub
		return dao.deleteMovieReview(review_num);
	}

	//관람평(댓글) 추가
	public int addMovieReviewLike(String memberId, int review_num) {
		// TODO Auto-generated method stub
		return dao.addMoviewReviewLike(memberId, review_num);
	}
	
	//관람평(댓글) 삭제
	public int deleteMovieReviewLike(String memberId, String review_num) {
		// TODO Auto-generated method stub
		return dao.deleteMovieReviewLike(memberId, review_num);
	}

	//관리자 - 관람평 list
//	public List<MovieReviewVO> getAdminMovieReviewList(String search_word) {
//		// TODO Auto-generated method stub
//		return dao.adminMovieReviewList(search_word);
//	}
	
	//관리자 - 관람평 갯수
	public int getAdminMovieReviewCnt() {
		// TODO Auto-generated method stub
		return dao.adminMovieReviewListCnt();
	}

	//관리자 - 관람평 list
	public List<MovieReviewVO> getAdminMovieReviewList(int page, int limit) {
	    
		HashMap<String, Integer> map = new HashMap<String, Integer>();
	    int startrow = (page - 1) * limit + 1;
	    int endrow = startrow + limit - 1;
	    map.put("start", startrow);
	    map.put("end", endrow);
		
	    return dao.adminMovieReviewList(map);
	}

	//관리자 - 관람평 삭제
	public int adminDeleteMovieReview(int review_num) {
		// TODO Auto-generated method stub
		return dao.adminDeleteMovieReview(review_num);
	}

	
	//
	
	@Override
	public double getAvgReviewPoint(String movieCode) {
	    double total = 0.0;
	    List<MovieReviewVO> reviewList = dao.getMovieReview(movieCode);

	    for (MovieReviewVO review : reviewList) {
	        total += review.getMovie_Review_star();
	    }

	    double avg = total / reviewList.size();

	    // 소수점 첫째 자리에서 반올림
	    avg = Math.round(avg * 10.0) / 10.0;
	    
	    return avg;
	}
	
	//누적관객수
	@Override
	public int getTotalAudience(String movieCode) {
		int total = 0;
		total = dao.getTotalAudience(movieCode);
		
		return total;
	}
	
	

	

}
