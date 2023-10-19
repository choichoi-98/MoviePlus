package com.hta.movieplus.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostCommentVO;
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
			if (movie.getMovie_Poster().length() > 10) {
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

	@Override
	public List<MoviePostVO> getMoviePostList(String option, int index, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		
		
		dataMap.put("option", option);
		dataMap.put("index", index);
		dataMap.put("keyword", keyword);
		
		
		return mapper.getMoviePostList(dataMap);
	}

	@Override
	public MoviePostVO getPostDetail(int postNum) {
		// TODO Auto-generated method stub
		return mapper.getPostDetail(postNum);
	}

	@Override
	public List<Movie> getMovieWithPostCnt() {
		// TODO Auto-generated method stub
		
		List<Movie> list = mapper.getMovieWithPostCnt();
		for (Movie movie : list) {
			if (movie.getMovie_Poster().length() > 10) {
				movie.setMovie_Poster(movie.getMovie_Poster().substring(0, 60));
			}
		}
		return list;
	}

	@Override
	public int getTotalCnt() {
		// TODO Auto-generated method stub
		return mapper.getTotalCount();
	}

	@Override
	public int getMyPostCnt(String MEMBER_ID) {
		// TODO Auto-generated method stub
		return mapper.getMyPostCnt(MEMBER_ID);
	}

	@Override
	public int checkLike(int postNum, Member member) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("POST_NUM", postNum);
		dataMap.put("MEMBER_ID", member.getMEMBER_ID());
		return mapper.checkLike(dataMap);
	}

	@Override
	public int addLikeByPostNum(int postNum, Member member) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("POST_NUM", postNum);
		dataMap.put("MEMBER_ID", member.getMEMBER_ID());
		
		return mapper.addLikeByPostNum(dataMap);
	}

	@Override
	public int deleteLikeByPostNum(int postNum, Member member) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("POST_NUM", postNum);
		dataMap.put("MEMBER_ID", member.getMEMBER_ID());
		
		return mapper.deleteLikeByPostNum(dataMap);
	}

	@Override
	public int addMoviePostComment(MoviePostCommentVO comment) {
		// TODO Auto-generated method stub
		return mapper.insertComment(comment);
	}

	@Override
	public List<MoviePostCommentVO> getCommemtListByPostNum(int postNum) {
		// TODO Auto-generated method stub
		return mapper.getCommemtListByPostNum(postNum);
	}

	@Override
	public int deleteCommentByCommNum(int comment_num) {
		// TODO Auto-generated method stub
		return mapper.deleteCommentById(comment_num);
	}

	@Override
	public int deletePost(int postNum) {
		// TODO Auto-generated method stub
		return mapper.deletePostById(postNum);
	}
	


}
