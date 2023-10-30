package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Total;
import com.hta.movieplus.mybatis.mapper.ManagerTotalMapper;

@Service
public class ManagerTotalServiceImpl implements ManagerTotalService {
	
	ManagerTotalMapper mapper;
	
	public ManagerTotalServiceImpl(ManagerTotalMapper mapper) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}

	@Override
	public List<Total> dayReserveRate(int theaterId, String THEATER_SCHEDULE_DATE) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("theaterId", theaterId);
		dataMap.put("THEATER_SCHEDULE_DATE", THEATER_SCHEDULE_DATE);
		
		return mapper.dayReserveRate(dataMap);
	}

	@Override
	public int daySeatCount(int theaterId, String THEATER_SCHEDULE_DATE) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("theaterId", theaterId);
		dataMap.put("THEATER_SCHEDULE_DATE", THEATER_SCHEDULE_DATE);
		
		return mapper.daySeatCount(dataMap);
	}

	@Override
	public int dayTicketSales(int theaterId, String THEATER_SCHEDULE_DATE) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("theaterId", theaterId);
		dataMap.put("THEATER_SCHEDULE_DATE", THEATER_SCHEDULE_DATE);
		
		return mapper.dayTicketSales(dataMap);
	}


	@Override
	public List<Total> dayMovieseatCount(int theaterId, String THEATER_SCHEDULE_DATE) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("theaterId", theaterId);
		dataMap.put("THEATER_SCHEDULE_DATE", THEATER_SCHEDULE_DATE);
		
		return mapper.dayMovieseatCount(dataMap);
	}

	@Override
	public List<Total> monthReserveRate(int theaterId, String THEATER_SCHEDULE_DATE) {
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("theaterId", theaterId);
		dataMap.put("THEATER_SCHEDULE_DATE", THEATER_SCHEDULE_DATE);
		
		return mapper.monthReserveRate(dataMap);
	}

	@Override
	public List<Total> daySeatRate(int theaterId, String THEATER_SCHEDULE_DATE) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("theaterId", theaterId);
		dataMap.put("THEATER_SCHEDULE_DATE", THEATER_SCHEDULE_DATE);
		
		return mapper.daySeatRate(dataMap);
	}

	@Override
	public List<Total> monthEachReserveRate(int theaterId, String month) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("theaterId", theaterId);
		dataMap.put("month", month);
		
	   return mapper.monthEachReserveRate(dataMap);
	}

	
	
}
