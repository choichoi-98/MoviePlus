package com.hta.movieplus.domain;

public class MoviePostVO {

	private int moviepost_Num;
	private String movie_Code;
	private String member_Id;
	private String moviepost_Still;
	private String moviepost_Content;
	private String moviepost_Reg_date;
	private int moviepost_Like = 0;
//	--
	private String movie_Title;
	private String MEMBER_PROFILE;
	
	
	
	public int getMoviepost_Num() {
		return moviepost_Num;
	}
	public void setMoviepost_Num(int moviepost_Num) {
		this.moviepost_Num = moviepost_Num;
	}
	public String getMovie_Code() {
		return movie_Code;
	}
	public void setMovie_Code(String movie_Code) {
		this.movie_Code = movie_Code;
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
	public int getMoviepost_Like() {
		return moviepost_Like;
	}
	public void setMoviepost_Like(int moviepost_Like) {
		this.moviepost_Like = moviepost_Like;
	}
	public String getMovie_Title() {
		return movie_Title;
	}
	public void setMovie_Title(String movie_Title) {
		this.movie_Title = movie_Title;
	}
	public String getMoviepost_Reg_date() {
		return moviepost_Reg_date;
	}
	public void setMoviepost_Reg_date(String moviepost_Reg_date) {
		this.moviepost_Reg_date = moviepost_Reg_date;
	}
	
	public boolean isMovieTitleContainKeyword(String keyword) {
		
		return this.movie_Title.trim().contains(keyword.trim());
	}
	public String getMEMBER_PROFILE() {
		return MEMBER_PROFILE;
	}
	public void setMEMBER_PROFILE(String mEMBER_PROFILE) {
		MEMBER_PROFILE = mEMBER_PROFILE;
	}
	
}
