package com.hta.movieplus.domain;

public class TheaterSchedule {
	private int THEATER_SCHEDULE_ID;
	private int THEATER_ID;
	private int THEATER_ROOM_ID;
	private String THEATER_SCHEDULE_START;
	private String THEATER_SCHEDULE_END;
	private String THEATER_SCHEDULE_DATE;
	private String MOVIE_CODE;
	private String THEATER_SCHEDULE_TYPE;
	// ---------------------------
	private String THEATER_ROOM_NAME;
	private String MOVIE_TITLE;
	private String THEATER_NAME;
	private int ScheduleCnt;
	
	
	
	
	public String getTHEATER_ROOM_NAME() {
		return THEATER_ROOM_NAME;
	}
	public void setTHEATER_ROOM_NAME(String tHEATER_ROOM_NAME) {
		THEATER_ROOM_NAME = tHEATER_ROOM_NAME;
	}
	public String getMOVIE_TITLE() {
		return MOVIE_TITLE;
	}
	public void setMOVIE_TITLE(String mOVIE_TITLE) {
		MOVIE_TITLE = mOVIE_TITLE;
	}
	public int getTHEATER_SCHEDULE_ID() {
		return THEATER_SCHEDULE_ID;
	}
	public void setTHEATER_SCHEDULE_ID(int tHEATER_SCHEDULE_ID) {
		THEATER_SCHEDULE_ID = tHEATER_SCHEDULE_ID;
	}
	public int getTHEATER_ID() {
		return THEATER_ID;
	}
	public void setTHEATER_ID(int tHEATER_ID) {
		THEATER_ID = tHEATER_ID;
	}
	public int getTHEATER_ROOM_ID() {
		return THEATER_ROOM_ID;
	}
	public void setTHEATER_ROOM_ID(int tHEATER_ROOM_ID) {
		THEATER_ROOM_ID = tHEATER_ROOM_ID;
	}
	public String getTHEATER_SCHEDULE_START() {
		return THEATER_SCHEDULE_START;
	}
	public void setTHEATER_SCHEDULE_START(String tHEATER_SCHEDULE_START) {
		THEATER_SCHEDULE_START = tHEATER_SCHEDULE_START;
	}
	public String getTHEATER_SCHEDULE_END() {
		return THEATER_SCHEDULE_END;
	}
	public void setTHEATER_SCHEDULE_END(String tHEATER_SCHEDULE_END) {
		THEATER_SCHEDULE_END = tHEATER_SCHEDULE_END;
	}
	public String getTHEATER_SCHEDULE_DATE() {
		return THEATER_SCHEDULE_DATE;
	}
	public void setTHEATER_SCHEDULE_DATE(String tHEATER_SCHEDULE_DATE) {
		THEATER_SCHEDULE_DATE = tHEATER_SCHEDULE_DATE;
	}
	public String getMOVIE_CODE() {
		return MOVIE_CODE;
	}
	public void setMOVIE_CODE(String mOVIE_CODE) {
		MOVIE_CODE = mOVIE_CODE;
	}
	public String getTHEATER_SCHEDULE_TYPE() {
		return THEATER_SCHEDULE_TYPE;
	}
	public void setTHEATER_SCHEDULE_TYPE(String tHEATER_SCHEDULE_TYPE) {
		THEATER_SCHEDULE_TYPE = tHEATER_SCHEDULE_TYPE;
	}
	public String getTHEATER_NAME() {
		return THEATER_NAME;
	}
	public void setTHEATER_NAME(String tHEATER_NAME) {
		THEATER_NAME = tHEATER_NAME;
	}
	public int getScheduleCnt() {
		return ScheduleCnt;
	}
	public void setScheduleCnt(int scheduleCnt) {
		ScheduleCnt = scheduleCnt;
	}
	
	
	
}
