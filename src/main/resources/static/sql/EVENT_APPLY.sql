CREATE TABLE EVENT_APPLY (
	EVENT_APPLY_NUM NUMBER PRIMARY KEY,						--이벤트 응모 번호
 	MEMBER_ID VARCHAR2(100),					--회원 아이디
	EVENT_NUM NUMBER,							--이벤트 번호
	EVENT_DRAW VARCHAR2(30),					--당첨 여부
	EVENT_APPLYDATE VARCHAR2(20),
 	FOREIGN KEY (EVENT_NUM) REFERENCES EVENT(EVENT_NUM) ON DELETE CASCADE
);


