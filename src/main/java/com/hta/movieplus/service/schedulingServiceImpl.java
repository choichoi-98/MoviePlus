package com.hta.movieplus.service;

import org.springframework.stereotype.Service;

import com.hta.movieplus.mybatis.mapper.SchedulingMapper;

@Service
public class schedulingServiceImpl implements SchedulingService {
	
	SchedulingMapper mapper;
	
	public schedulingServiceImpl(SchedulingMapper mapper) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}

}
