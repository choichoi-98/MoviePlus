package com.hta.movieplus.domain;

public class MoviePostVO {

	private int moviepost_Num;
	private String movie_Code;
	private String member_Id;
	private String moviepost_Still;
	private String moviepost_Content;
	private String moviepost_Reg_data;
	private int moviepost_Like = 0;
	
	
	public String getMovie_Code() {
		return movie_Code;
	}
	public void setMovie_Code(String movie_Code) {
		this.movie_Code = movie_Code;
	}
	public int getMoviepost_Like() {
		return moviepost_Like;
	}
	public void setMoviepost_Like(int moviepost_Like) {
		this.moviepost_Like = moviepost_Like;
	}
	public int getMoviepost_Num() {
		return moviepost_Num;
	}
	public void setMoviepost_Num(int moviepost_Num) {
		this.moviepost_Num = moviepost_Num;
	}
	public String getMember_Id() {
		return member_Id;
	}	
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public String getMoviepost_Still() {
		return moviepost_Still;
	}
	public void setMoviepost_Still(String moviepost_Still) {
		this.moviepost_Still = moviepost_Still;
	}
	public String getMoviepost_Content() {
		return moviepost_Content;
	}
	public void setMoviepost_Content(String moviepost_Content) {
		this.moviepost_Content = moviepost_Content;
	}
	public String getMoviepost_Reg_data() {
		return moviepost_Reg_data;
	}
	public void setMoviepost_Reg_data(String moviepost_Reg_data) {
		this.moviepost_Reg_data = moviepost_Reg_data;
	}
	
}
