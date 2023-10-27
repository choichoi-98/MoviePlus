package com.hta.movieplus.domain;

public class Total {
	
	private double ratio;
	private int RNUM;
	private int rate;
	private int THEATER_SCHEDULE_ID;
	private int THEATER_ID;
	private int THEATER_ROOM_ID;
	private String THEATER_SCHEDULE_START;
	private String THEATER_SCHEDULE_END;
	private String THEATER_SCHEDULE_DATE;
	private String MOVIE_CODE;
	private String THEATER_SCHEDULE_TYPE;
	private String THEATER_SCHEDULE_STATUS;
	// ---------------------------
	private String THEATER_ROOM_NAME;
	private String MOVIE_TITLE;
	private String MOVIE_POSTER;
	private String THEATER_NAME;
	private int ScheduleCnt;
	private String THEATER_ROOM_SEAT;
	private int THEATER_ROOM_SEAT_CNT;
	// ---------------------------
	private int THEATER_SCHEDULE_BOOKED_CNT;
	
	
	private String THEATER_ROOM_STATUS;
	private String THEATER_ROOM_CREATED_DATE;
	private int SCHEDULE_CNT;
	
    private String movie_Director;	//영화감독
    private String movie_Actors;		//출연배우
    private String movie_Genre;		//대표장르
    private String movie_Runtime;	//상영시간
    private String movie_OpenDate;	//개봉일
    private String movie_Grade;		//상영등급
    private String movie_Plot;		//줄거리
    private int movie_Star;			//평점
    private String movie_Release;	//개봉상태(개봉, 개봉예정)
    private String movie_Screen; //상영상태(상영가능,상영예정,상영종로,상영중)
	private String MOVIE_DIBS_OBJECT; //보고싶어요 한 영화
	private int review_Count;	//댓글 수
	private String movie_Still;
	private String interest_Status;//보고싶어요
	private int post_Count;		//무비 포스트 수
	
	private int REOPEN_COUNT;
	private String REOPENING_STARTDATE;
	private String REOPENING_ENDDATE;
	
	private int KPAY_NUM; // 카트 번호(PK)
	private int KPAY_AMOUNT; // 총 금액
	private int KPAY_SEAT_CNT; // 선택한 자리 갯수
	private String KPAY_OCCUPIED_SEAT;
	private String MEMBER_ID;
	private String pg_token;
	private String KPAY_DATE;
	
	private int PAY_NUM; // 상품 번호
	private String PAY_NAME; // 상품 이름
	private int PAY_AMOUNT; // 금액
	private String PAY_MENU;
	private String PAY_DATE;
	
	
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
	public String getTHEATER_SCHEDULE_STATUS() {
		return THEATER_SCHEDULE_STATUS;
	}
	public void setTHEATER_SCHEDULE_STATUS(String tHEATER_SCHEDULE_STATUS) {
		THEATER_SCHEDULE_STATUS = tHEATER_SCHEDULE_STATUS;
	}
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
	public String getMOVIE_POSTER() {
		return MOVIE_POSTER;
	}
	public void setMOVIE_POSTER(String mOVIE_POSTER) {
		MOVIE_POSTER = mOVIE_POSTER;
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
	public String getTHEATER_ROOM_SEAT() {
		return THEATER_ROOM_SEAT;
	}
	public void setTHEATER_ROOM_SEAT(String tHEATER_ROOM_SEAT) {
		THEATER_ROOM_SEAT = tHEATER_ROOM_SEAT;
	}
	public int getTHEATER_ROOM_SEAT_CNT() {
		return THEATER_ROOM_SEAT_CNT;
	}
	public void setTHEATER_ROOM_SEAT_CNT(int tHEATER_ROOM_SEAT_CNT) {
		THEATER_ROOM_SEAT_CNT = tHEATER_ROOM_SEAT_CNT;
	}
	public int getTHEATER_SCHEDULE_BOOKED_CNT() {
		return THEATER_SCHEDULE_BOOKED_CNT;
	}
	public void setTHEATER_SCHEDULE_BOOKED_CNT(int tHEATER_SCHEDULE_BOOKED_CNT) {
		THEATER_SCHEDULE_BOOKED_CNT = tHEATER_SCHEDULE_BOOKED_CNT;
	}
	public String getTHEATER_ROOM_STATUS() {
		return THEATER_ROOM_STATUS;
	}
	public void setTHEATER_ROOM_STATUS(String tHEATER_ROOM_STATUS) {
		THEATER_ROOM_STATUS = tHEATER_ROOM_STATUS;
	}
	public String getTHEATER_ROOM_CREATED_DATE() {
		return THEATER_ROOM_CREATED_DATE;
	}
	public void setTHEATER_ROOM_CREATED_DATE(String tHEATER_ROOM_CREATED_DATE) {
		THEATER_ROOM_CREATED_DATE = tHEATER_ROOM_CREATED_DATE;
	}
	public int getSCHEDULE_CNT() {
		return SCHEDULE_CNT;
	}
	public void setSCHEDULE_CNT(int sCHEDULE_CNT) {
		SCHEDULE_CNT = sCHEDULE_CNT;
	}
	public String getMovie_Director() {
		return movie_Director;
	}
	public void setMovie_Director(String movie_Director) {
		this.movie_Director = movie_Director;
	}
	public String getMovie_Actors() {
		return movie_Actors;
	}
	public void setMovie_Actors(String movie_Actors) {
		this.movie_Actors = movie_Actors;
	}
	public String getMovie_Genre() {
		return movie_Genre;
	}
	public void setMovie_Genre(String movie_Genre) {
		this.movie_Genre = movie_Genre;
	}
	public String getMovie_Runtime() {
		return movie_Runtime;
	}
	public void setMovie_Runtime(String movie_Runtime) {
		this.movie_Runtime = movie_Runtime;
	}
	public String getMovie_OpenDate() {
		return movie_OpenDate;
	}
	public void setMovie_OpenDate(String movie_OpenDate) {
		this.movie_OpenDate = movie_OpenDate;
	}
	public String getMovie_Grade() {
		return movie_Grade;
	}
	public void setMovie_Grade(String movie_Grade) {
		this.movie_Grade = movie_Grade;
	}
	public String getMovie_Plot() {
		return movie_Plot;
	}
	public void setMovie_Plot(String movie_Plot) {
		this.movie_Plot = movie_Plot;
	}
	public int getMovie_Star() {
		return movie_Star;
	}
	public void setMovie_Star(int movie_Star) {
		this.movie_Star = movie_Star;
	}
	public String getMovie_Release() {
		return movie_Release;
	}
	public void setMovie_Release(String movie_Release) {
		this.movie_Release = movie_Release;
	}
	public String getMovie_Screen() {
		return movie_Screen;
	}
	public void setMovie_Screen(String movie_Screen) {
		this.movie_Screen = movie_Screen;
	}
	public String getMOVIE_DIBS_OBJECT() {
		return MOVIE_DIBS_OBJECT;
	}
	public void setMOVIE_DIBS_OBJECT(String mOVIE_DIBS_OBJECT) {
		MOVIE_DIBS_OBJECT = mOVIE_DIBS_OBJECT;
	}
	public int getReview_Count() {
		return review_Count;
	}
	public void setReview_Count(int review_Count) {
		this.review_Count = review_Count;
	}
	public String getMovie_Still() {
		return movie_Still;
	}
	public void setMovie_Still(String movie_Still) {
		this.movie_Still = movie_Still;
	}
	public String getInterest_Status() {
		return interest_Status;
	}
	public void setInterest_Status(String interest_Status) {
		this.interest_Status = interest_Status;
	}
	public int getPost_Count() {
		return post_Count;
	}
	public void setPost_Count(int post_Count) {
		this.post_Count = post_Count;
	}
	public int getREOPEN_COUNT() {
		return REOPEN_COUNT;
	}
	public void setREOPEN_COUNT(int rEOPEN_COUNT) {
		REOPEN_COUNT = rEOPEN_COUNT;
	}
	public String getREOPENING_STARTDATE() {
		return REOPENING_STARTDATE;
	}
	public void setREOPENING_STARTDATE(String rEOPENING_STARTDATE) {
		REOPENING_STARTDATE = rEOPENING_STARTDATE;
	}
	public String getREOPENING_ENDDATE() {
		return REOPENING_ENDDATE;
	}
	public void setREOPENING_ENDDATE(String rEOPENING_ENDDATE) {
		REOPENING_ENDDATE = rEOPENING_ENDDATE;
	}
	public int getKPAY_NUM() {
		return KPAY_NUM;
	}
	public void setKPAY_NUM(int kPAY_NUM) {
		KPAY_NUM = kPAY_NUM;
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
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getPg_token() {
		return pg_token;
	}
	public void setPg_token(String pg_token) {
		this.pg_token = pg_token;
	}
	public String getKPAY_DATE() {
		return KPAY_DATE;
	}
	public void setKPAY_DATE(String kPAY_DATE) {
		KPAY_DATE = kPAY_DATE;
	}
	public int getPAY_NUM() {
		return PAY_NUM;
	}
	public void setPAY_NUM(int pAY_NUM) {
		PAY_NUM = pAY_NUM;
	}
	public String getPAY_NAME() {
		return PAY_NAME;
	}
	public void setPAY_NAME(String pAY_NAME) {
		PAY_NAME = pAY_NAME;
	}
	public int getPAY_AMOUNT() {
		return PAY_AMOUNT;
	}
	public void setPAY_AMOUNT(int pAY_AMOUNT) {
		PAY_AMOUNT = pAY_AMOUNT;
	}
	public String getPAY_MENU() {
		return PAY_MENU;
	}
	public void setPAY_MENU(String pAY_MENU) {
		PAY_MENU = pAY_MENU;
	}
	public String getPAY_DATE() {
		return PAY_DATE;
	}
	public void setPAY_DATE(String pAY_DATE) {
		PAY_DATE = pAY_DATE;
	}
	public double getRatio() {
		return ratio;
	}
	public void setRatio(double ratio) {
		this.ratio = ratio;
	}
	public int getRNUM() {
		return RNUM;
	}
	public void setRNUM(int rNUM) {
		RNUM = rNUM;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	
	
}
