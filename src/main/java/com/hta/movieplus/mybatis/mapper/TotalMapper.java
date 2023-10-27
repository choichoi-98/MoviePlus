package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Total;

@Mapper
public interface TotalMapper {
	
	public List<Total> dayReserveRate(String THEATER_SCHEDULE_DATE);

	public int daySeatCount(String THEATER_SCHEDULE_DATE);

	public int dayTicketSales(String THEATER_SCHEDULE_DATE);

	public int dayGoodsSales(String THEATER_SCHEDULE_DATE);

	public int dayTotalSales(String THEATER_SCHEDULE_DATE);

	public List<Total> dayMovieseatCount(String THEATER_SCHEDULE_DATE);
	
}
