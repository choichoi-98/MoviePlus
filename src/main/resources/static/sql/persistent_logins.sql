--로그인 테이블

create table persistent_logins(
	username	varchar2(64) not null,
	series		varchar2(64) primary key,
	token		varchar2(64) not null,		--브라우저가 갖고 있는 쿠키의 값을 검증할 인증값
	last_used	timestamp	 not null		--가장 최신 자동 로그인 시간
);