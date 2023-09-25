package com.hta.movieplus.domain;

public class Member {
	private int    MEMBER_NUM; 					//회원번호
	private String MEMBER_NAME;					//이름
	private String MEMBER_ID;					//아이디
	private String MEMBER_PASS;					//비밀번호
	private String MEMBER_EMAIL;				//이메일
	private String MEMBER_PHONENO;				//전화번호
	private String MEMBER_BIRTH;				//생년월일
	private String MEMBER_PROFILE;				//프로필 사진
	private String MEMBER_AUTH="ROLE_USER";		//권한(ROLE_USER, ROLE_ADMIN)
	private String MEMBER_LOGINTYPE;			//로그인타입(일반로그인, 소셜로그인)
	private String MEMBER_MEMBERSHIP;			//멤버등급
	private int    MEMBER_POINT;				//적립 포인트
	
	
}
