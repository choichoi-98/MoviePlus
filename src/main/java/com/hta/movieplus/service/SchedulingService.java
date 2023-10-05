package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.TheaterSchedule;

public interface SchedulingService {

	List<TheaterSchedule> getScheduleList(int theaterId, String todayDate, String selectedRoom);

	String getTodayDate();

}
