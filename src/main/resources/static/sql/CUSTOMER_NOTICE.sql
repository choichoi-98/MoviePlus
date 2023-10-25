관리자페이지 공지사항 테이블
create table CUSTOMER_NOTICE(
CUSTOMER_NOTICE_NUM                    NUMBER PRIMARY KEY,           -- 글번호
CUSTOMER_NOTICE_TYPE                     VARCHAR2(20),                     -- Movieplus공지/지점공지 선택(thaterId)
CUSTOMER_NOTICE_REGION                 VARCHAR2(20),                     -- 지역 
CUSTOMER_NOTICE_THEATER               VARCHAR2(30),                     -- 극장명 (theaterName)
CUSTOMER_NOTICE_SUBJECT                VARCHAR2(100),                     -- 제목
CUSTOMER_NOTICE_CONTENT              VARCHAR2(3000),                   -- 내용
CUSTOMER_NOTICE_SYSDATE               VARCHAR2(20)                  -- 등록일
);


