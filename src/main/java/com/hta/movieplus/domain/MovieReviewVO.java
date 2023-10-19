package com.hta.movieplus.domain;

import java.sql.Date;

public class MovieReviewVO {
	private int movie_Review_num; 	//관람평 고유 번호
	private String member_Id;		//멤버 아이디
	private String movie_Review_content; //관람평 내용
	private String movie_code;		//영화 코드
	private Date movie_Review_reg_date; //등록일
	private int movie_Review_like;	//좋아요 
	private String MEMBER_PROFILE;				//프로필 사진
	private int movie_Review_star;
	private int movie_Review_like_cnt;//좋아요 수
	private String movie_Title;		//영화 제목
	
	
	public String getMovie_Title() {
		return movie_Title;
	}
	public void setMovie_Title(String movie_Title) {
		this.movie_Title = movie_Title;
	}
	public int getMovie_Review_like_cnt() {
		return movie_Review_like_cnt;
	}
	public void setMovie_Review_like_cnt(int movie_Review_like_cnt) {
		this.movie_Review_like_cnt = movie_Review_like_cnt;
	}
	public int getMovie_Review_num() {
		return movie_Review_num;
	}
	public void setMovie_Review_num(int movie_Review_num) {
		this.movie_Review_num = movie_Review_num;
	}
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public String getMovie_Review_content() {
		return movie_Review_content;
	}
	public void setMovie_Review_content(String movie_Review_content) {
		this.movie_Review_content = movie_Review_content;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public Date getMovie_Review_reg_date() {
		return movie_Review_reg_date;
	}
	public void setMovie_Review_reg_date(Date movie_Review_reg_date) {
		this.movie_Review_reg_date = movie_Review_reg_date;
	}
	public int getMovie_Review_like() {
		return movie_Review_like;
	}
	public void setMovie_Review_like(int movie_Review_like) {
		this.movie_Review_like = movie_Review_like;
	}
	public String getMEMBER_PROFILE() {
		return MEMBER_PROFILE;
	}
	public void setMEMBER_PROFILE(String mEMBER_PROFILE) {
		MEMBER_PROFILE = mEMBER_PROFILE;
	}
	public int getMovie_Review_star() {
		return movie_Review_star;
	}
	public void setMovie_Review_star(int movie_Review_star) {
		this.movie_Review_star = movie_Review_star;
	}
	
	
	
}
