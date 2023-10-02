package com.hta.movieplus.domain;

public class Theater {
	private int THEATER_ID;
	private String THEATER_NAME;
	private String THEATER_INTRO1;
	private String THEATER_INTRO2;
	private int THEATER_POST;
	private String THEATER_ADDRESS1;
	private String THEATER_ADDRESS2;
	private String THEATER_LOCATION;
	private String THEATER_PARKING;
	private String THEATER_MANAGER_ID;
	private String THEATER_STATUS = "대기";
	private String THEATER_DISABLED_SEAT = "UNCHECKED";
	private String THEATER_SPECIAL_SEAT = "UNCHECKED";
	private String THEATER_CREATED_DATE;
	
	private int THEATER_ROOM_CNT;
	
	
	public int getTHEATER_POST() {
		return THEATER_POST;
	}
	public void setTHEATER_POST(int tHEATER_POST) {
		THEATER_POST = tHEATER_POST;
	}
	public String getTHEATER_ADDRESS1() {
		return THEATER_ADDRESS1;
	}
	public void setTHEATER_ADDRESS1(String tHEATER_ADDRESS1) {
		THEATER_ADDRESS1 = tHEATER_ADDRESS1;
	}
	public String getTHEATER_ADDRESS2() {
		return THEATER_ADDRESS2;
	}
	public void setTHEATER_ADDRESS2(String tHEATER_ADDRESS2) {
		THEATER_ADDRESS2 = tHEATER_ADDRESS2;
	}
	public int getTHEATER_ID() {
		return THEATER_ID;
	}
	public void setTHEATER_ID(int tHEATER_ID) {
		THEATER_ID = tHEATER_ID;
	}
	public String getTHEATER_NAME() {
		return THEATER_NAME;
	}
	public void setTHEATER_NAME(String tHEATER_NAME) {
		THEATER_NAME = tHEATER_NAME;
	}
	public String getTHEATER_INTRO1() {
		return THEATER_INTRO1;
	}
	public void setTHEATER_INTRO1(String tHEATER_INTRO1) {
		THEATER_INTRO1 = tHEATER_INTRO1;
	}
	public String getTHEATER_INTRO2() {
		return THEATER_INTRO2;
	}
	public void setTHEATER_INTRO2(String tHEATER_INTRO2) {
		THEATER_INTRO2 = tHEATER_INTRO2;
	}
	public String getTHEATER_LOCATION() {
		return THEATER_LOCATION;
	}
	public void setTHEATER_LOCATION(String tHEATER_LOCATION) {
		THEATER_LOCATION = tHEATER_LOCATION;
	}
	
	public String getTHEATER_PARKING() {
		return THEATER_PARKING;
	}
	public void setTHEATER_PARKING(String tHEATER_PARKING) {
		THEATER_PARKING = tHEATER_PARKING;
	}
	public String getTHEATER_MANAGER_ID() {
		return THEATER_MANAGER_ID;
	}
	public void setTHEATER_MANAGER_ID(String tHEATER_MANAGER_ID) {
		THEATER_MANAGER_ID = tHEATER_MANAGER_ID;
	}
	public String getTHEATER_STATUS() {
		return THEATER_STATUS;
	}
	public void setTHEATER_STATUS(String tHEATER_STATUS) {
		THEATER_STATUS = tHEATER_STATUS;
	}
	public String getTHEATER_DISABLED_SEAT() {
		return THEATER_DISABLED_SEAT;
	}
	public void setTHEATER_DISABLED_SEAT(String tHEATER_DISABLED_SEAT) {
		THEATER_DISABLED_SEAT = tHEATER_DISABLED_SEAT;
	}
	public String getTHEATER_SPECIAL_SEAT() {
		return THEATER_SPECIAL_SEAT;
	}
	public void setTHEATER_SPECIAL_SEAT(String tHEATER_SPECIAL_SEAT) {
		THEATER_SPECIAL_SEAT = tHEATER_SPECIAL_SEAT;
	}
	public String getTHEATER_CREATED_DATE() {
		return THEATER_CREATED_DATE;
	}
	public void setTHEATER_CREATED_DATE(String tHEATER_CREATED_DATE) {
		THEATER_CREATED_DATE = tHEATER_CREATED_DATE;
	}
	public int getTHEATER_ROOM_CNT() {
		return THEATER_ROOM_CNT;
	}
	public void setTHEATER_ROOM_CNT(int tHEATER_ROOM_CNT) {
		THEATER_ROOM_CNT = tHEATER_ROOM_CNT;
	}
	
	
	
}
