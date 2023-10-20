package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostCommentVO;
import com.hta.movieplus.domain.MoviePostVO;

@Mapper
public interface MoviePostMapper {

	List<Movie> getSeenMovieList(String memberId);

	Movie getMovieByCode(String movieCode);

	void insert(MoviePostVO post);

	List<MoviePostVO> getMoviePostList(Map<String, Object> dataMap);

	MoviePostVO getPostDetail(int postNum);

	List<Movie> getMovieWithPostCnt();

	int getTotalCount();

	int getMyPostCnt(String mEMBER_ID);

	int checkLike(Map<String, Object> dataMap);

	int addLikeByPostNum(Map<String, Object> dataMap);

	int deleteLikeByPostNum(Map<String, Object> dataMap);

	int insertComment(MoviePostCommentVO comment);

	List<MoviePostCommentVO> getCommemtListByPostNum(int postNum);

	int deleteCommentById(int comment_num);

	int deletePostById(int postNum);

}
