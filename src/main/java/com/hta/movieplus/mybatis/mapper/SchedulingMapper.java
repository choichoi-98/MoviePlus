package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Movie;
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

}
