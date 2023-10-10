package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.TheaterSchedule;

public interface SchedulingService {

	List<TheaterSchedule> getScheduleList(int theaterId, String todayDate);

	String getTodayDate();

	List<Movie> getOpenMovieList(String keyword);

	int addSchedule(TheaterSchedule schedule);

	int deleteSchedule(int scheduleId);

	TheaterSchedule getSchedule(int scheduleId);

	int updateSchedule(TheaterSchedule schedule);

}
