package com.hta.movieplus.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MovieDibsVO;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.domain.TimeTableDate;

public interface SchedulingService {

	List<TheaterSchedule> getScheduleList(int theaterId, String todayDate);

	String getTodayDate();

	List<Movie> getOpenMovieList(String keyword);

	int addSchedule(TheaterSchedule schedule);

	int deleteSchedule(int scheduleId);

	TheaterSchedule getSchedule(int scheduleId);

	int updateSchedule(TheaterSchedule schedule);

	List<TimeTableDate> getDateList();

	List<TheaterSchedule> getMovieScheduleWithMovie(Map<String, Object> dataMap);

	List<Theater> getTheaterWithMovie(Map<String, Object> dataMap);

	List<TheaterRoom> getTheaterRoomWithMovie(Map<String, Object> dataMap);

	List<Movie> getMovieWithTheater(Map<String, Object> dataMap);

	List<TheaterRoom> getTheaterRoomWithTheater(Map<String, Object> dataMap);

	List<TheaterSchedule> getScheduleWithTheater(Map<String, Object> dataMap);

	List<Movie> getOpenMovieListWithScheduleCnt(String date);

	List<TheaterSchedule> getTheaterRoomWithScheduleCnt(String movieCode, String date);

	List<TheaterSchedule> getScheduleListByDateAndMovieCodeAndTheaterId(String movieCode, String date,
			String theaterId);

	Movie getMovieDetailByCode(String movieCode);

	List<MovieDibsVO> getMovieDibsList(String name);

	int changeScheduleStatus(LocalDateTime now);

}
