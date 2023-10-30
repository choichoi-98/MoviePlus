package com.hta.movieplus.service;

import java.time.LocalDateTime;
import java.util.List;

import com.hta.movieplus.domain.Total;

public interface TotalService {

	public List<Total> dayReserveRate(String THEATER_SCHEDULE_DATE);

	public int daySeatCount(String currentdate);

	public int dayTicketSales(String currentdate);

	public int dayGoodsSales(String currentdate);

	public int dayTotalSales(String currentdate);

	public List<Total> dayMovieseatCount(String currentdate);

	public List<Total> monthReserveRate(String currentdate);

	public List<Total> dayTicketSalesRate(String currentdate);

	public List<Total> monthEachReserveRate(String month);

	
}
