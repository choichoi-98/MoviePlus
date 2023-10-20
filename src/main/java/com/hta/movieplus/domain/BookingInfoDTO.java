package com.hta.movieplus.domain;

public class BookingInfoDTO {

	private int KPAY_NUM; // 카트 번호(PK)
	
	private int THEATER_SCHEDULE_ID; 
	private int THEATER_ROOM_ID;
	
	private String MOVIE_CODE;
    private String MOVIE_TITLE;		
    private String MOVIE_DIRECTOR;	
    private String MOVIE_GENRE;		
    private String MOVIE_RUNTIME;	// 상영시간
    private String MOVIE_OPENDATE;	// 개봉일
    private String MOVIE_GRADE;		// 상영등급
    private int MOVIE_STAR;			// 평점
	
	private int KPAY_AMOUNT; // 최종결제 금액
	private int KPAY_SEAT_CNT; // 선택한 자리 갯수 == 사람 수
	private String KPAY_OCCUPIED_SEAT;
	private String MEMBER_ID;
	private String pg_token;
	
	public int getKPAY_NUM() {
		return KPAY_NUM;
	}
	public void setKPAY_NUM(int kPAY_NUM) {
		KPAY_NUM = kPAY_NUM;
	}
	public int getTHEATER_SCHEDULE_ID() {
		return THEATER_SCHEDULE_ID;
	}
	public void setTHEATER_SCHEDULE_ID(int tHEATER_SCHEDULE_ID) {
		THEATER_SCHEDULE_ID = tHEATER_SCHEDULE_ID;
	}
	public int getKPAY_AMOUNT() {
		return KPAY_AMOUNT;
	}
	public void setKPAY_AMOUNT(int kPAY_AMOUNT) {
		KPAY_AMOUNT = kPAY_AMOUNT;
	}
	public int getKPAY_SEAT_CNT() {
		return KPAY_SEAT_CNT;
	}
	public void setKPAY_SEAT_CNT(int kPAY_SEAT_CNT) {
		KPAY_SEAT_CNT = kPAY_SEAT_CNT;
	}
	public String getKPAY_OCCUPIED_SEAT() {
		return KPAY_OCCUPIED_SEAT;
	}
	public void setKPAY_OCCUPIED_SEAT(String kPAY_OCCUPIED_SEAT) {
		KPAY_OCCUPIED_SEAT = kPAY_OCCUPIED_SEAT;
	}
	public String getPg_token() {
		return pg_token;
	}
	public void setPg_token(String pg_token) {
		this.pg_token = pg_token;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public int getTHEATER_ROOM_ID() {
		return THEATER_ROOM_ID;
	}
	public void setTHEATER_ROOM_ID(int tHEATER_ROOM_ID) {
		THEATER_ROOM_ID = tHEATER_ROOM_ID;
	}
	public String getMOVIE_CODE() {
		return MOVIE_CODE;
	}
	public void setMOVIE_CODE(String mOVIE_CODE) {
		MOVIE_CODE = mOVIE_CODE;
	}
	public String getMOVIE_TITLE() {
		return MOVIE_TITLE;
	}
	public void setMOVIE_TITLE(String mOVIE_TITLE) {
		MOVIE_TITLE = mOVIE_TITLE;
	}
	public String getMOVIE_DIRECTOR() {
		return MOVIE_DIRECTOR;
	}
	public void setMOVIE_DIRECTOR(String mOVIE_DIRECTOR) {
		MOVIE_DIRECTOR = mOVIE_DIRECTOR;
	}
	public String getMOVIE_GENRE() {
		return MOVIE_GENRE;
	}
	public void setMOVIE_GENRE(String mOVIE_GENRE) {
		MOVIE_GENRE = mOVIE_GENRE;
	}
	public String getMOVIE_RUNTIME() {
		return MOVIE_RUNTIME;
	}
	public void setMOVIE_RUNTIME(String mOVIE_RUNTIME) {
		MOVIE_RUNTIME = mOVIE_RUNTIME;
	}
	public String getMOVIE_OPENDATE() {
		return MOVIE_OPENDATE;
	}
	public void setMOVIE_OPENDATE(String mOVIE_OPENDATE) {
		MOVIE_OPENDATE = mOVIE_OPENDATE;
	}
	public String getMOVIE_GRADE() {
		return MOVIE_GRADE;
	}
	public void setMOVIE_GRADE(String mOVIE_GRADE) {
		MOVIE_GRADE = mOVIE_GRADE;
	}
	public int getMOVIE_STAR() {
		return MOVIE_STAR;
	}
	public void setMOVIE_STAR(int mOVIE_STAR) {
		MOVIE_STAR = mOVIE_STAR;
	}
	
}