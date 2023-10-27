package com.hta.movieplus.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Total;
import com.hta.movieplus.mybatis.mapper.TotalMapper;

@Service
public class TotalServiceImpl implements TotalService {

	private TotalMapper dao;
	private static final Logger logger = LoggerFactory.getLogger(TotalServiceImpl.class);

	
	@Autowired
	public TotalServiceImpl(TotalMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<Total> dayReserveRate(String THEATER_SCHEDULE_DATE) {
		return dao.dayReserveRate(THEATER_SCHEDULE_DATE);
	}

	@Override
	public int daySeatCount(String THEATER_SCHEDULE_DATE) {
		return dao.daySeatCount(THEATER_SCHEDULE_DATE);
	}

	@Override
	public int dayTicketSales(String THEATER_SCHEDULE_DATE) {
		return dao.dayTicketSales(THEATER_SCHEDULE_DATE);
	}

	@Override
	public int dayGoodsSales(String currentdate) {
		return dao.dayGoodsSales(currentdate);
	}

	@Override
	public int dayTotalSales(String currentdate) {
		return dao.dayTotalSales(currentdate);
	}

	@Override
	public List<Total> dayMovieseatCount(String THEATER_SCHEDULE_DATE) {
		return dao.dayMovieseatCount(THEATER_SCHEDULE_DATE);
	}


	

}
