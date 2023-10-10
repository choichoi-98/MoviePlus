package com.hta.movieplus.domain;

public class FavoriteTheater {
	
	private int FAVORITE_THEATER_ID;
	private int MEMBER_NUM;
	private int THEATER_ID;
// 	--------------
	private String THEATER_NAME;
	
	public int getFAVORITE_THEATER_ID() {
		return FAVORITE_THEATER_ID;
	}
	public void setFAVORITE_THEATER_ID(int fAVORITE_THEATER_ID) {
		FAVORITE_THEATER_ID = fAVORITE_THEATER_ID;
	}
	public int getMEMBER_NUM() {
		return MEMBER_NUM;
	}
	public void setMEMBER_NUM(int mEMBER_NUM) {
		MEMBER_NUM = mEMBER_NUM;
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
	
	
	
	
}
