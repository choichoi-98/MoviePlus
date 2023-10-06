package com.hta.movieplus.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.mybatis.mapper.SchedulingMapper;

@Service
public class schedulingServiceImpl implements SchedulingService {
	
	private static final Logger logger = LoggerFactory.getLogger(schedulingServiceImpl.class);
	SchedulingMapper mapper;
	
	public schedulingServiceImpl(SchedulingMapper mapper) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}

	@Override
	public List<TheaterSchedule> getScheduleList(int theaterId, String todayDate) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("theaterId", theaterId);
		dataMap.put("todayDate", todayDate);
		return mapper.getScheduleList(dataMap);
	}

	@Override
	public String getTodayDate() {
		// TODO Auto-generated method stub
		LocalDate now = LocalDate.now();
		
		return now.toString();
	}

	@Override
	public List<Movie> getOpenMovieList(String keyword) {
		// TODO Auto-generated method stub
		List<Movie> movieList = mapper.getOpenMovieList();
		
		return movieList.stream()
				.filter(item -> item.getMovie_Title().contains(keyword))
				.collect(Collectors.toList());
	}

	@Override
	public int addSchedule(TheaterSchedule schedule) {
		// TODO Auto-generated method stub
		String endTime = calculateEndTime(schedule);
				
		schedule.setTHEATER_SCHEDULE_END(endTime);
		
		return mapper.addSchedule(schedule);
	}

	private String calculateEndTime(TheaterSchedule schedule) {
		// TODO Auto-generated method stub
		Movie movie = mapper.getMovieByID(schedule.getMOVIE_CODE() + "");
		
		LocalTime startTime = LocalTime.parse(schedule.getTHEATER_SCHEDULE_START());
		
		return startTime.plusMinutes(Integer.parseInt(movie.getMovie_Runtime())).toString();
	}
	
	

}
