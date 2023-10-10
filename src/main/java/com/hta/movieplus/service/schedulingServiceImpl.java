package com.hta.movieplus.service;

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
	
		return checkScheduleOverlap(schedule) ? mapper.addSchedule(schedule) : -1; 
	}

	private boolean checkScheduleOverlap(TheaterSchedule schedule) {
		// TODO Auto-generated method stub
		List<TheaterSchedule> scheduleList = mapper.getScheduleListByTheaterRoomId(schedule);
		
		int listSize = scheduleList.size();
		
		if(listSize == 0){ // 스케줄 없는 경우
			return true;
		}
		
		LocalTime compStartTime = LocalTime.parse(schedule.getTHEATER_SCHEDULE_START());
		LocalTime compEndTime = LocalTime.parse(schedule.getTHEATER_SCHEDULE_END());

//		LocalTime firstTime = LocalTime.parse(scheduleList.get(0).getTHEATER_SCHEDULE_START());
//		LocalTime LastTime = LocalTime.parse(scheduleList.get(scheduleList.size()-1).getTHEATER_SCHEDULE_END());
//		
//		if(compStartTime.isAfter(LastTime) && compEndTime.isBefore(firstTime)) {
//			return true;
//		}// 가장 처음, 가장 끝 로직
		
		
		for(int i=0;i<listSize;i++) {
			LocalTime origStartTime = LocalTime.parse(scheduleList.get(i).getTHEATER_SCHEDULE_START());
			LocalTime origEndTime = LocalTime.parse(scheduleList.get(i).getTHEATER_SCHEDULE_END());
			
			if(origStartTime.isAfter(origEndTime)) {
				logger.info("넘어감");
				origEndTime = LocalTime.of(0,0,0);
			}
		
			
			
//			if(i==0 && compEndTime.isBefore(LocalTime.parse(scheduleList.get(0).getTHEATER_SCHEDULE_START()))) {
//				return true;
//			}
			
			if(compStartTime.isAfter(origEndTime)) { // 
				if(i == listSize-1) {
					return true;
				}else {
					if(compEndTime.isBefore(LocalTime.parse(scheduleList.get(i+1).getTHEATER_SCHEDULE_START()))) {
						return true;
					}
				}
			}
			
			
		}

		return false;
	}

	private String calculateEndTime(TheaterSchedule schedule) {
		// TODO Auto-generated method stub
		Movie movie = mapper.getMovieByID(schedule.getMOVIE_CODE());
		
		LocalTime startTime = LocalTime.parse(schedule.getTHEATER_SCHEDULE_START());
		
		return startTime.plusMinutes(Integer.parseInt(movie.getMovie_Runtime())).toString();
	}

	@Override
	public int deleteSchedule(int scheduleId) {
		// TODO Auto-generated method stub
		return mapper.deleteScheduleById(scheduleId);
	}

	@Override
	public TheaterSchedule getSchedule(int scheduleId) {
		// TODO Auto-generated method stub
		return mapper.getScheduleById(scheduleId);
	}

	@Override
	public int updateSchedule(TheaterSchedule schedule) {
		// TODO Auto-generated method stub
		return mapper.updateSchedule(schedule);
	}
	
	

}
