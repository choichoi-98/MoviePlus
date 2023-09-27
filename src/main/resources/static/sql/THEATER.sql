CREATE SEQUENCE THEATER_SEQ;

CREATE TABLE THEATER(
 	THEATER_ID NUMBER PRIMARY KEY,
 	THEATER_NAME VARCHAR2(300) NOT NULL,
 	THEATER_INTRO1 VARCHAR2(3000) NOT NULL,
 	THEATER_INTRO2 VARCHAR2(3000) NOT NULL,
 	THEATER_ADDRESS VARCHAR2(1000) NOT NULL,
 	THEATER_LOCATION VARCHAR2(100) NOT NULL,
 	THEATER_PARKING VARCHAR2(3000) NOT NULL,
 	THEATER_MANAGER_ID VARCHAR2(100) NOT NULL,
 	THEATER_STATUS VARCHAR2(50) NOT NULL,
 	THEATER_DISABLED_SEAT VARCHAR2(20),
 	THEATER_SPECIAL_SEAT VARCHAR2(20),
	THEATER_CREATED_DATE VARCHAR2(200)
	);