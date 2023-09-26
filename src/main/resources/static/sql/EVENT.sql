--이벤트 테이블
create table EVENT(
	EVENT_NUM		NUMBER,			--이벤트 글 번호
	EVENT_TYPE		VARCHAR2(20),	--이벤트 종류
	EVENT_SUBJECT	VARCHAR2(200),	--이벤트 제목
	EVENT_CONTENT	VARCHAR2(4000),	--이벤트 내용
	EVENT_DATE		DATE,			--작성일자
	EVENT_POSTER	VARCHAR2(200),	--이벤트 포스터
	EVENT_PERIOD	DATE			--게시기간?

);


--이벤트 댓글/응모내역
create table EVENT_COMMENT(
	EVENT_COMMENT_NUM			NUMBER			--댓글 번호
	MEMBER_ID					VARCHAR2(20)	--회원 아이디
	EVENT_COMMENT_CONTENT		VARCHAR2(500)	--댓글 내용
	EVENT_COMMENT_DATE			DATE			--댓글 작성일자
	EVENT_NUM					NUMBER			--게시글 번호
	EVENT_COMMENT_RE_SEQ		NUMBER			--댓글 시퀀스
	EVENTCOMMENT_RE_REF			NUMBER			--댓글 레퍼런스
);