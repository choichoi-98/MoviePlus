package com.hta.movieplus.domain;

public class EventApply {
	
	private String MEMBER_ID; 					//회원 아이디
	private int EVENT_NUM;						//이벤트번호
	private String EVENT_DRAW="N";				//당첨 여부(기본값 N / 당첨시 Y)
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public int getEVENT_NUM() {
		return EVENT_NUM;
	}
	public void setEVENT_NUM(int eVENT_NUM) {
		EVENT_NUM = eVENT_NUM;
	}
	public String getEVENT_DRAW() {
		return EVENT_DRAW;
	}
	public void setEVENT_DRAW(String eVENT_DRAW) {
		EVENT_DRAW = eVENT_DRAW;
	}
	
	
	
}
