package com.hta.movieplus.domain;

public class Movie {
	private String movie_Code;		//영화번호
    private String movie_Title;		//영화제목
    private String movie_Director;	//영화감독
    private String movie_Poster;		//영화 포스터
    private String movie_Actors;		//출연배우
    private String movie_Genre;		//대표장르
    private String movie_Runtime;	//상영시간
    private String movie_OpenDate;	//개봉일
    private String movie_Grade;		//상영등급
    private String movie_Plot;		//줄거리
    private int movie_Star;			//평점
    private String movie_Release;	//개봉상태(개봉, 개봉예정)
	public String getMovie_Code() {
		return movie_Code;
	}
	public void setMovie_Code(String movie_Code) {
		this.movie_Code = movie_Code;
	}
	public String getMovie_Title() {
		return movie_Title;
	}
	public void setMovie_Title(String movie_Title) {
		this.movie_Title = movie_Title;
	}
	public String getMovie_Director() {
		return movie_Director;
	}
	public void setMovie_Director(String movie_Director) {
		this.movie_Director = movie_Director;
	}
	public String getMovie_Poster() {
		return movie_Poster;
	}
	public void setMovie_Poster(String movie_Poster) {
		this.movie_Poster = movie_Poster;
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
   
	
}
