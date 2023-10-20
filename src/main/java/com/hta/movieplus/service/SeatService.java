package com.hta.movieplus.service;

import java.util.List;

public interface SeatService {

	public int getSeatCount(String seatStr);
	
	public String makeSeatStr(String inputStr, int scheduleId);
	
	public List<String> getBookedSeatList(int scheduleId);
}
