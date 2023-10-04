--회원 테이블
create table MEMBER(
	MEMBER_NUM			NUMBER,							--회원번호
	MEMBER_NAME			VARCHAR2(20)	NOT NULL,		--이름
	MEMBER_ID			VARCHAR2(20)	NOT NULL,		--아이디
	MEMBER_PASS			VARCHAR2(100)	NOT NULL,		--비밀번호
	MEMBER_EMAIL		VARCHAR2(50)	NOT NULL,		--이메일
	MEMBER_PHONENO		VARCHAR2(20)	NOT NULL,		--전화번호
	MEMBER_BIRTH		VARCHAR2(10)	NOT NULL,		--생년월일
	MEMBER_PROFILE		VARCHAR2(300),					--프로필 사진
	MEMBER_AUTH			VARCHAR2(20) 	NOT NULL,		--권한(ROLE_USER, ROLE_ADMIN)
	MEMBER_LOGINTYPE	VARCHAR2(3),					--로그인타입(일반로그인, 소셜로그인)
	MEMBER_MEMBERSHIP	VARCHAR2(100)	,				--멤버등급
	MEMBER_POINT		NUMBER,							--적립 포인트
	PRIMARY KEY(MEMBER_NUM)
);



insert into member
values(2, '홍동동', 'kim123', '1', 'aaa@aaa.aaa','01012345678','19000101',null,'ROLE_ADMIN', null, null, null);


insert into member
values((select nvl(max(MEMBER_NUM),0)+1 from MEMBER), '관리자', 'kk1223', '1', 'aaa@aaa.aaa','01012345678','19000101',null,'ROLE_USER', null, null, null);