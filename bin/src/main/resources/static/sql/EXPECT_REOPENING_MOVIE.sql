create table EXPECT_REOPENING_MOVIE (
MOVIE_EXPECT_NUM               NUMBER PRIMARY KEY,
MOVIE_CODE               VARCHAR2(20),             -- 영화코드
REOPENING_STARTDATE  VARCHAR2(20),            -- 시작일
REOPENING_ENDDATE    VARCHAR2(20)              -- 종료일
);

시퀸스명 INCREASE_MOVIE_EXPECT_NUM

