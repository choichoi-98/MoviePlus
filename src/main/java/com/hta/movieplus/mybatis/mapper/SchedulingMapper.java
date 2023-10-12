package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.domain.TheaterSchedule;

@Mapper
public interface SchedulingMapper {

	List<TheaterSchedule> getScheduleList(Map<String, Object> dataMap);

	List<Movie> getOpenMovieList();

	int addSchedule(TheaterSchedule schedule);

	Movie getMovieByID(String movie_CODE);

	int deleteScheduleById(int scheduleId);

	TheaterSchedule getScheduleById(int scheduleId);

	int updateSchedule(TheaterSchedule schedule);

	List<TheaterSchedule> getScheduleListByTheaterRoomId(TheaterSchedule schedule);

	List<TheaterSchedule> getMovieScheduleWithMovie(Map<String, Object> dataMap);

	List<Theater> getTheaterWithMovie(Map<String, Object> dataMap);

	List<TheaterRoom> getTheaterRoomWithMovie(Map<String, Object> dataMap);

	List<Movie> getMovieWithTheater(Map<String, Object> dataMap);

	List<TheaterRoom> getTheaterRoomWithTheater(Map<String, Object> dataMap);

	List<TheaterSchedule> getScheduleWithTheater(Map<String, Object> dataMap);

	List<Movie> getOpenMovieListWithScheduleCnt();


}
