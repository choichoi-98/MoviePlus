package com.hta.movieplus.domain;

import java.sql.Date;

public class MovieReviewVO {
	private int movie_Review_num; 	//관람평 고유 번호
	private String member_id;		//멤버 아이디
	private String movie_Review_content; //관람평 내용
	private String movie_code;		//영화 코드
	private Date movie_Review_reg_date; //등록일
	private int movie_Review_like;	//좋아요 
	
	public int getMovie_Review_num() {
		return movie_Review_num;
	}
	public void setMovie_Review_num(int movie_Review_num) {
		this.movie_Review_num = movie_Review_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	
	
}
