package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostCommentVO;
import com.hta.movieplus.domain.MoviePostVO;

public interface MoviePostService {

	List<Movie> getSeenMovieList(String memberId);

	Movie getMovieByCode(String movieCode);

	List<String> getStillCutByCode(String movieCode);

	void insert(MoviePostVO post);

	List<MoviePostVO> getMoviePostList(String option, int index, String keyword);

	MoviePostVO getPostDetail(int postNum);

	List<Movie> getMovieWithPostCnt();

	int getTotalCnt();

	int getMyPostCnt(String MEMBER_ID);

	int checkLike(int postNum, Member member);

	int addLikeByPostNum(int postNum, Member member);

	int deleteLikeByPostNum(int postNum, Member member);

	int addMoviePostComment(MoviePostCommentVO comment);

	List<MoviePostCommentVO> getCommemtListByPostNum(int postNum);

	int deleteCommentByCommNum(int comment_num);

	int deletePost(int postNum);
}
