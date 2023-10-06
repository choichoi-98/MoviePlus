package com.hta.movieplus.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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

}
