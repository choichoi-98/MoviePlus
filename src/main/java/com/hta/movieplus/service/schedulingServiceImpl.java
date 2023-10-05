package com.hta.movieplus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.mybatis.mapper.ScheduleMapper;

@Service
public class schedulingServiceImpl implements SchedulingService {
	
	ScheduleMapper mapper;
	
	public schedulingServiceImpl(ScheduleMapper mapper) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}

	@Override
	public List<TheaterSchedule> getScheduleList(int theaterId) {
		// TODO Auto-generated method stub
		return mapper.getScheduleList(theaterId);
	}

}
