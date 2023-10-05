package com.hta.movieplus.domain;

public class TheaterSchedule {
	private int THEATER_SCHEDULE_ID;
	private int THEATER_ROOM_ID;
	private String THEATER_SCHEDULE_STARTTIME;
	private int MOVIE_CODE;
	private String THEATER_SCHEDULE_TYPE;
	
	
	public int getTHEATER_SCHEDULE_ID() {
		return THEATER_SCHEDULE_ID;
	}
	public void setTHEATER_SCHEDULE_ID(int tHEATER_SCHEDULE_ID) {
		THEATER_SCHEDULE_ID = tHEATER_SCHEDULE_ID;
	}
	public int getTHEATER_ROOM_ID() {
		return THEATER_ROOM_ID;
	}
	public void setTHEATER_ROOM_ID(int tHEATER_ROOM_ID) {
		THEATER_ROOM_ID = tHEATER_ROOM_ID;
	}
	public String getTHEATER_SCHEDULE_STARTTIME() {
		return THEATER_SCHEDULE_STARTTIME;
	}
	public void setTHEATER_SCHEDULE_STARTTIME(String tHEATER_SCHEDULE_STARTTIME) {
		THEATER_SCHEDULE_STARTTIME = tHEATER_SCHEDULE_STARTTIME;
	}
	public int getMOVIE_CODE() {
		return MOVIE_CODE;
	}
	public void setMOVIE_CODE(int mOVIE_CODE) {
		MOVIE_CODE = mOVIE_CODE;
	}
	public String getTHEATER_SCHEDULE_TYPE() {
		return THEATER_SCHEDULE_TYPE;
	}
	public void setTHEATER_SCHEDULE_TYPE(String tHEATER_SCHEDULE_TYPE) {
		THEATER_SCHEDULE_TYPE = tHEATER_SCHEDULE_TYPE;
	}
	
	
	
}
