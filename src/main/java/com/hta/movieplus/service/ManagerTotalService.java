package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Total;

public interface ManagerTotalService {
	
	public List<Total> dayReserveRate(int theaterId, String THEATER_SCHEDULE_DATE);

	public int daySeatCount(int theaterId, String currentdate);

	public int dayTicketSales(int theaterId, String currentdate);

	public List<Total> dayMovieseatCount(int theaterId, String currentdate);

	public List<Total> monthReserveRate(int theaterId, String currentdate);

	public List<Total> daySeatRate(int theaterId, String THEATER_SCHEDULE_DATE);
	
}
