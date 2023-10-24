package com.hta.movieplus.domain;

public class EventApply {
	
	private int EVENT_APPLY_NUM;				//이벤트 신청 번호
	private String MEMBER_ID; 					//회원 아이디
	private int EVENT_NUM;						//이벤트번호
	private String EVENT_DRAW="N";				//당첨 여부(기본값 N / 당첨시 Y)
	private String EVENT_APPLYDATE; 			//이벤트 응모일
	private int RNUM;
	private String EVENT_SUBJECT; 
	private String EVENT_RESULTDATE; 
	private String EVENT_TYPE; 
	
	
	
	public String getEVENT_APPLYDATE() {
		return EVENT_APPLYDATE;
	}
	public void setEVENT_APPLYDATE(String eVENT_APPLYDATE) {
		EVENT_APPLYDATE = eVENT_APPLYDATE;
	}
	public int getEVENT_APPLY_NUM() {
		return EVENT_APPLY_NUM;
	}
	public void setEVENT_APPLY_NUM(int eVENT_APPLY_NUM) {
		EVENT_APPLY_NUM = eVENT_APPLY_NUM;
	}
	public String getEVENT_SUBJECT() {
		return EVENT_SUBJECT;
	}
	public void setEVENT_SUBJECT(String eVENT_SUBJECT) {
		EVENT_SUBJECT = eVENT_SUBJECT;
	}
	public String getEVENT_RESULTDATE() {
		return EVENT_RESULTDATE;
	}
	public void setEVENT_RESULTDATE(String eVENT_RESULTDATE) {
		EVENT_RESULTDATE = eVENT_RESULTDATE;
	}
	public String getEVENT_TYPE() {
		return EVENT_TYPE;
	}
	public void setEVENT_TYPE(String eVENT_TYPE) {
		EVENT_TYPE = eVENT_TYPE;
	}
	public int getRNUM() {
		return RNUM;
	}
	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}
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
