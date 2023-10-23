package com.hta.movieplus.domain;

public class ReOpenVO {
   private String MOVIE_EXPECT_NUM; //PK 
   private String MOVIE_CODE;  //영화코드
   private String REOPENING_STARTDATE; // 시작일
   private String REOPENING_ENDDATE; //종료일
   private String MOVIE_TITLE; 
   
   public String getMOVIE_EXPECT_NUM() {
	return MOVIE_EXPECT_NUM;
   }
   public void setMOVIE_EXPECT_NUM(String mOVIE_EXPECT_NUM) {
	MOVIE_EXPECT_NUM = mOVIE_EXPECT_NUM;
   }
   public String getMOVIE_CODE() {
      return MOVIE_CODE;
   }
   public void setMOVIE_CODE(String mOVIE_CODE) {
      MOVIE_CODE = mOVIE_CODE;
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
public String getMOVIE_TITLE() {
	return MOVIE_TITLE;
}
public void setMOVIE_TITLE(String mOVIE_TITLE) {
	MOVIE_TITLE = mOVIE_TITLE;
}
   
   
}