package com.hta.movieplus.domain;

public class TheaterRoom {
	private int THEATER_ROOM_ID;
	private String THEATER_ROOM_NAME;
	private String THEATER_ROOM_SEAT_TYPE;
	private String THEATER_ROOM_STATUS ="대기";
	private String THEATER_ROOM_CREATED_DATE;
	private int THEATER_ID;

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

	public String getTHEATER_ROOM_SEAT_TYPE() {
		return THEATER_ROOM_SEAT_TYPE;
	}

	public void setTHEATER_ROOM_SEAT_TYPE(String tHEATER_ROOM_SEAT_TYPE) {
		THEATER_ROOM_SEAT_TYPE = tHEATER_ROOM_SEAT_TYPE;
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

	@Override
	public String toString() {
		return "TheaterRoom [THEATER_ROOM_ID=" + THEATER_ROOM_ID + ", THEATER_ROOM_NAME=" + THEATER_ROOM_NAME
				+ ", THEATER_ROOM_SEAT_TYPE=" + THEATER_ROOM_SEAT_TYPE + ", THEATER_ROOM_STATUS=" + THEATER_ROOM_STATUS
				+ ", THEATER_ROOM_CREATED_DATE=" + THEATER_ROOM_CREATED_DATE + ", THEATER_ID=" + THEATER_ID + "]";
	}

}
