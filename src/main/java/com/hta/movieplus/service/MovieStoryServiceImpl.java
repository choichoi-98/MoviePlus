package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MoviePostVO;
import com.hta.movieplus.domain.MovieReviewVO;
import com.hta.movieplus.domain.StorePayVO;
import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.mybatis.mapper.MovieMapper;
import com.hta.movieplus.mybatis.mapper.MoviePostMapper;
import com.hta.movieplus.mybatis.mapper.MovieStoryMapper;

@Service
public class MovieStoryServiceImpl implements MovieStoryService {

	MovieStoryMapper movieStoryMapper;
	MovieMapper movieMapper;
	MoviePostMapper postMapper;
	
	@Autowired
	public MovieStoryServiceImpl(MovieStoryMapper movieStoryMapper, MovieMapper movieMapper, MoviePostMapper postMapper) {
		// TODO Auto-generated constructor stub
		this.movieStoryMapper = movieStoryMapper;
		this.movieMapper = movieMapper;
		this.postMapper = postMapper;
	}
	
	@Override
	public List<MoviePostVO> getMoviePostList(String memberId) {
		// TODO Auto-generated method stub
		return movieStoryMapper.getMoviePostListByMemberId(memberId);
	}

	@Override
	public List<Movie> getMovieDibsList(String memberId) {
		// TODO Auto-generated method stub
		List<Movie> list = movieStoryMapper.getMovieDibsListByMemberId(memberId);
		
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
		List<MovieReviewVO> list = movieStoryMapper.getMovieReviewListByMemberId(memberId);
		for (MovieReviewVO review : list) {
			if (review.getMOVIE_POSTER().length() > 10) {
				review.setMOVIE_POSTER(review.getMOVIE_POSTER().substring(0, 60));
			}
		}
		
		return list;
	}

	@Override
	public List<TheaterSchedule> getScheduleList(String memberId) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("memberId", memberId);
		
		List<TheaterSchedule> list = movieStoryMapper.getScheduleListByMemberId(memberId);
		
		for (TheaterSchedule schedule : list) {
			if (schedule.getMOVIE_POSTER().length() > 10) {
				schedule.setMOVIE_POSTER(schedule.getMOVIE_POSTER().substring(0, 60));
			}
		}
		
		return list;
	}
	
	@Override
	public void deleteReview(String review_num) {
		// TODO Auto-generated method stub
		movieMapper.deleteMovieReview(review_num);
		
	}

	@Override
	public void deleteDibs(String movieCode, String member_ID) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("movieCode", movieCode);
		map.put("memberId", member_ID);
		movieStoryMapper.deleteDibs(map);
	}

	@Override
	public void deletePost(int post_num) {
		// TODO Auto-generated method stub
		postMapper.deletePostById(post_num);
	}

	@Override
	public List<TheaterSchedule> getBookedList(String memberId) {
		// TODO Auto-generated method stub
		List<TheaterSchedule> list = movieStoryMapper.getBookedList(memberId);
		
		
		for (TheaterSchedule schedule : list) {
			if (schedule.getMOVIE_POSTER().length() > 10) {
				schedule.setMOVIE_POSTER(schedule.getMOVIE_POSTER().substring(0, 60));
			}
		}
		
		
		
		return list.stream().filter(item -> item.getTHEATER_SCHEDULE_STATUS().equals("상영")).collect(Collectors.toList());
	}

	@Override
	public List<StorePayVO> getStoreList(String memberId) {
		// TODO Auto-generated method stub
		return movieStoryMapper.getStoreList(memberId);
	}

	

}
