package com.hta.movieplus.domain;

public class MovieReviewLikeVO {
	private int movie_Review_like_num; //pk
	private String member_Id; //멤버 id
	private int movie_Review_like_object; //좋아요 한 댓글
	public int getMovie_Review_like_num() {
		return movie_Review_like_num;
	}
	public void setMovie_Review_like_num(int movie_Review_like_num) {
		this.movie_Review_like_num = movie_Review_like_num;
	}
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public int getMovie_Review_like_object() {
		return movie_Review_like_object;
	}
	public void setMovie_Review_like_object(int movie_Review_like_object) {
		this.movie_Review_like_object = movie_Review_like_object;
	}
}
