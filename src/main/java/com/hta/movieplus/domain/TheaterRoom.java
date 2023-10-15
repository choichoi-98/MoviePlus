package com.hta.movieplus.domain;

public class TheaterRoom {
	private int THEATER_ROOM_ID;
	private String THEATER_ROOM_NAME;
	private String THEATER_ROOM_SEAT;
	private String THEATER_ROOM_STATUS ="대기";
	private String THEATER_ROOM_CREATED_DATE;
	private int THEATER_ID;
	//--
	private int SCHEDULE_CNT;
	private int THEATER_ROOM_SEAT_CNT;
	
	
	
	public int getTHEATER_ROOM_ID() {
		return THEATER_ROOM_ID;
	}

	public void setTHEATER_ROOM_ID(int tHEATER_ROOM_ID) {
		THEATER_ROOM_ID = tHEATER_ROOM_ID;
	}

	public String getTHEATER_ROOM_NAME() {
		return THEATER_ROOM_NAME;
	}

	public void setTHEATER_ROOM_NAME(String tHEATER_ROOM_NAME) {
		THEATER_ROOM_NAME = tHEATER_ROOM_NAME;
	}

	public String getTHEATER_ROOM_STATUS() {
		return THEATER_ROOM_STATUS;
	}

	public void setTHEATER_ROOM_STATUS(String tHEATER_ROOM_STATUS) {
		THEATER_ROOM_STATUS = tHEATER_ROOM_STATUS;
	}

	public String getTHEATER_ROOM_CREATED_DATE() {
		return THEATER_ROOM_CREATED_DATE;
	}

	public void setTHEATER_CREATED_DATE(String tHEATER_CREATED_DATE) {
		THEATER_ROOM_CREATED_DATE = tHEATER_CREATED_DATE;
	}

	public int getTHEATER_ID() {
		return THEATER_ID;
	}

	public void setTHEATER_ID(int tHEATER_ID) {
		THEATER_ID = tHEATER_ID;
	}

	public int getSCHEDULE_CNT() {
		return SCHEDULE_CNT;
	}

	public void setSCHEDULE_CNT(int sCHEDULE_CNT) {
		SCHEDULE_CNT = sCHEDULE_CNT;
	}

	public String getTHEATER_ROOM_SEAT() {
		return THEATER_ROOM_SEAT;
	}

	public void setTHEATER_ROOM_SEAT(String tHEATER_ROOM_SEAT) {
		THEATER_ROOM_SEAT = tHEATER_ROOM_SEAT;
	}

	public int getTHEATER_ROOM_SEAT_CNT() {
		return THEATER_ROOM_SEAT_CNT;
	}

	public void setTHEATER_ROOM_SEAT_CNT(int tHEATER_ROOM_SEAT_CNT) {
		THEATER_ROOM_SEAT_CNT = tHEATER_ROOM_SEAT_CNT;
	}

}
