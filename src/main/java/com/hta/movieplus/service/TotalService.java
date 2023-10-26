package com.hta.movieplus.service;

import java.time.LocalDateTime;
import java.util.List;

import com.hta.movieplus.domain.Total;

public interface TotalService {

	public List<Total> dayReserveRate(String THEATER_SCHEDULE_DATE);

	public int daySeatCount(String currentdate);

	
}
