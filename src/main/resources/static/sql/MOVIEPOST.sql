CREATE TABLE MOVIEPOST (
  MOVIEPOST_NUM NUMBER,
  MOVIE_CODE VARCHAR2(10),
  MEMBER_ID VARCHAR2(20),
  MOVIEPOST_STILL VARCHAR2(4000),
  MOVIEPOST_CONTENT CLOB,
  MOVIEPOST_REG_DATE VARCHAR2(100),
  MOVIEPOST_LIKE NUMBER, 
  CONSTRAINT PK_MOVIEPOST PRIMARY KEY (MOVIEPOST_NUM)
);

CREATE SEQUENCE MOVIEPOST_SEQ;