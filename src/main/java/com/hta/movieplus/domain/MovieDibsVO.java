package com.hta.movieplus.domain;

public class MovieDibsVO {
	private String movie_Dibs_Id; //pk
	private String member_Id;	 //회원 id, member테이블 참조
	private String movie_Dibs_Object;//보고싶어요 한 영화
	
	public String getMovie_Dibs_Id() {
		return movie_Dibs_Id;
	}
	public void setMovie_Dibs_Id(String movie_Dibs_Id) {
		this.movie_Dibs_Id = movie_Dibs_Id;
	}
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public String getMovie_Dibs_Object() {
		return movie_Dibs_Object;
	}
	public void setMovie_Dibs_Object(String movie_Dibs_Object) {
		this.movie_Dibs_Object = movie_Dibs_Object;
	}
	
	
}
