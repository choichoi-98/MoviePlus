package com.hta.movieplus.domain;

public class Manager {
	private int    MEMBER_NUM; 					//회원번호
	private String MEMBER_NAME;					//이름
	private String MEMBER_ID;					//아이디
	private String MEMBER_PASS;					//비밀번호
	private String MEMBER_EMAIL = "manager@email.com";				//이메일
	private String MEMBER_PHONENO = "01012345678";				//전화번호
	private String MEMBER_BIRTH = "1912.12.12";				//생년월일
	private String MEMBER_PROFILE;				//프로필 사진
	private String MEMBER_AUTH="ROLE_MANAGER";		//권한(ROLE_USER, ROLE_ADMIN)
	private String MEMBER_LOGINTYPE;			//로그인타입(일반로그인, 소셜로그인)
	private String MEMBER_MEMBERSHIP;			//멤버등급
	private int    MEMBER_POINT;				//적립 포인트
	
	public int getMEMBER_NUM() {
		return MEMBER_NUM;
	}
	public void setMEMBER_NUM(int mEMBER_NUM) {
		MEMBER_NUM = mEMBER_NUM;
	}
	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_PASS() {
		return MEMBER_PASS;
	}
	public void setMEMBER_PASS(String mEMBER_PASS) {
		MEMBER_PASS = mEMBER_PASS;
	}
	public String getMEMBER_EMAIL() {
		return MEMBER_EMAIL;
	}
	public void setMEMBER_EMAIL(String mEMBER_EMAIL) {
		MEMBER_EMAIL = mEMBER_EMAIL;
	}
	public String getMEMBER_PHONENO() {
		return MEMBER_PHONENO;
	}
	public void setMEMBER_PHONENO(String mEMBER_PHONENO) {
		MEMBER_PHONENO = mEMBER_PHONENO;
	}
	public String getMEMBER_BIRTH() {
		return MEMBER_BIRTH;
	}
	public void setMEMBER_BIRTH(String mEMBER_BIRTH) {
		MEMBER_BIRTH = mEMBER_BIRTH;
	}
	public String getMEMBER_PROFILE() {
		return MEMBER_PROFILE;
	}
	public void setMEMBER_PROFILE(String mEMBER_PROFILE) {
		MEMBER_PROFILE = mEMBER_PROFILE;
	}
	public String getMEMBER_AUTH() {
		return MEMBER_AUTH;
	}
	public void setMEMBER_AUTH(String mEMBER_AUTH) {
		MEMBER_AUTH = mEMBER_AUTH;
	}
	public String getMEMBER_LOGINTYPE() {
		return MEMBER_LOGINTYPE;
	}
	public void setMEMBER_LOGINTYPE(String mEMBER_LOGINTYPE) {
		MEMBER_LOGINTYPE = mEMBER_LOGINTYPE;
	}
	public String getMEMBER_MEMBERSHIP() {
		return MEMBER_MEMBERSHIP;
	}
	public void setMEMBER_MEMBERSHIP(String mEMBER_MEMBERSHIP) {
		MEMBER_MEMBERSHIP = mEMBER_MEMBERSHIP;
	}
	public int getMEMBER_POINT() {
		return MEMBER_POINT;
	}
	public void setMEMBER_POINT(int mEMBER_POINT) {
		MEMBER_POINT = mEMBER_POINT;
	}
	public void resetPassword() {
		MEMBER_PASS = "movieplus0000";
	}
	
}
