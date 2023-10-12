package com.hta.movieplus.domain;

public class CustomerOneOnOneVO {
	private int CUSTOMER_NUM; // 1:1글 번호
	private String CUSTOMER_SELECT_WHERE; // 선택 타입
	private String CUSTOMER_SELECT_REGION; // 지역 선택
	private String CUSTOMER_SELECT_CENEMA; // 극장 선택
	private String CUSTOMER_TYPE; // 문의 유형 선택
	private String CUSTOMER_NAME; // 이름
	private String CUSTOMER_EMAIL; // email 주소
	private String CUSTOMER_PHONNUM1; // 전화번호 앞자리
	private String CUSTOMER_PHONNUM2; // 전화번호 중간자리
	private String CUSTOMER_PHONNUM3; // 전화번호 나머지 뒷자리
	private String CUSTOMER_PHONNUM; // 전화번호 통합
	private String CUSTOMER_TITLE; // 제목
	private String CUSTOMER_CONTENT; // 내용
	private int CUSTOMER_PASSWARD; // 글 비밀번호
	private String CUSTOMER_ANSWERSITUATION = "x"; // 답변 상태
	private String CUSTOMER_REGISTRATIONDATE;

	public int getCUSTOMER_NUM() {
		return CUSTOMER_NUM;
	}

	public void setCUSTOMER_NUM(int cUSTOMER_NUM) {
		CUSTOMER_NUM = cUSTOMER_NUM;
	}

	public String getCUSTOMER_SELECT_WHERE() {
		return CUSTOMER_SELECT_WHERE;
	}

	public void setCUSTOMER_SELECT_WHERE(String cUSTOMER_SELECT_WHERE) {
		CUSTOMER_SELECT_WHERE = cUSTOMER_SELECT_WHERE;
	}

	public String getCUSTOMER_SELECT_REGION() {
		return CUSTOMER_SELECT_REGION;
	}

	public void setCUSTOMER_SELECT_REGION(String cUSTOMER_SELECT_REGION) {
		CUSTOMER_SELECT_REGION = cUSTOMER_SELECT_REGION;
	}

	public String getCUSTOMER_SELECT_CENEMA() {
		return CUSTOMER_SELECT_CENEMA;
	}

	public void setCUSTOMER_SELECT_CENEMA(String cUSTOMER_SELECT_CENEMA) {
		CUSTOMER_SELECT_CENEMA = cUSTOMER_SELECT_CENEMA;
	}

	public String getCUSTOMER_TYPE() {
		return CUSTOMER_TYPE;
	}

	public void setCUSTOMER_TYPE(String cUSTOMER_TYPE) {
		CUSTOMER_TYPE = cUSTOMER_TYPE;
	}

	public String getCUSTOMER_NAME() {
		return CUSTOMER_NAME;
	}

	public void setCUSTOMER_NAME(String cUSTOMER_NAME) {
		CUSTOMER_NAME = cUSTOMER_NAME;
	}

	public String getCUSTOMER_EMAIL() {
		return CUSTOMER_EMAIL;
	}

	public void setCUSTOMER_EMAIL(String cUSTOMER_EMAIL) {
		CUSTOMER_EMAIL = cUSTOMER_EMAIL;
	}

	public String getCUSTOMER_PHONNUM1() {
		return CUSTOMER_PHONNUM1;
	}

	public void setCUSTOMER_PHONNUM1(String cUSTOMER_PHONNUM1) {
		CUSTOMER_PHONNUM1 = cUSTOMER_PHONNUM1;
	}

	public String getCUSTOMER_PHONNUM2() {
		return CUSTOMER_PHONNUM2;
	}

	public void setCUSTOMER_PHONNUM2(String cUSTOMER_PHONNUM2) {
		CUSTOMER_PHONNUM2 = cUSTOMER_PHONNUM2;
	}

	public String getCUSTOMER_PHONNUM3() {
		return CUSTOMER_PHONNUM3;
	}

	public void setCUSTOMER_PHONNUM3(String cUSTOMER_PHONNUM3) {
		CUSTOMER_PHONNUM3 = cUSTOMER_PHONNUM3;
	}

	public String getCUSTOMER_TITLE() {
		return CUSTOMER_TITLE;
	}

	public void setCUSTOMER_TITLE(String cUSTOMER_TITLE) {
		CUSTOMER_TITLE = cUSTOMER_TITLE;
	}

	public String getCUSTOMER_CONTENT() {
		return CUSTOMER_CONTENT;
	}

	public void setCUSTOMER_CONTENT(String cUSTOMER_CONTENT) {
		CUSTOMER_CONTENT = cUSTOMER_CONTENT;
	}

	public int getCUSTOMER_PASSWARD() {
		return CUSTOMER_PASSWARD;
	}

	public void setCUSTOMER_PASSWARD(int cUSTOMER_PASSWARD) {
		CUSTOMER_PASSWARD = cUSTOMER_PASSWARD;
	}

	public String getCUSTOMER_ANSWERSITUATION() {
		return CUSTOMER_ANSWERSITUATION;
	}

	public void setCUSTOMER_ANSWERSITUATION(String cUSTOMER_ANSWERSITUATION) {
		CUSTOMER_ANSWERSITUATION = cUSTOMER_ANSWERSITUATION;
	}

	public String getCUSTOMER_REGISTRATIONDATE() {
		return CUSTOMER_REGISTRATIONDATE;
	}

	public void setCUSTOMER_REGISTRATIONDATE(String cUSTOMER_REGISTRATIONDATE) {
		CUSTOMER_REGISTRATIONDATE = cUSTOMER_REGISTRATIONDATE;
	} // 등록일

	public String getCUSTOMER_PHONNUM() {
		return CUSTOMER_PHONNUM;
	}

	public void setCUSTOMER_PHONNUM(String CUSTOMER_PHONNUM) {
		this.CUSTOMER_PHONNUM = CUSTOMER_PHONNUM;
	}

}