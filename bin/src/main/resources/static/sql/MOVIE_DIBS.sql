CREATE TABLE MOVIE_DIBS (
    MOVIE_DIBS_ID VARCHAR2(20) PRIMARY KEY,
    MEMBER_ID VARCHAR2(20),
    MOVIE_DIBS_OBJECT VARCHAR2(20),
    FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID)
);