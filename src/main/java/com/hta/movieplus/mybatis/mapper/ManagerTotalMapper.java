package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Total;

@Mapper
public interface ManagerTotalMapper {
	
	public List<Total> dayReserveRate(Map<String, Object> dataMap);

	public int daySeatCount(Map<String, Object> dataMap);

	public int dayTicketSales(Map<String, Object> dataMap);

	public List<Total> dayMovieseatCount(Map<String, Object> dataMap);

	public List<Total> monthReserveRate(Map<String, Object> dataMap);

	public List<Total> daySeatRate(Map<String, Object> dataMap);
	
}
