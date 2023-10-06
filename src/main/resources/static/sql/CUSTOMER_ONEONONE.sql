고객센터 1대1문의 테이블(input, list, detail 부분 사용)
create table CUSTOMER_ONEONONE(
	CUSTOMER_NUM                           NUMBER PRIMARY KEY,        -- 글번호
	CUSTOMER_SELECT_WHERE               VARCHAR2(30),                -- 선택 타입
	CUSTOMER_SELECT_REGION              VARCHAR2(30),                -- 지역 선택
	CUSTOMER_SELECT_CENEMA             VARCHAR2(30),                -- 극장 선택
	CUSTOMER_TYPE                           VARCHAR2(30),                  -- 문의 유형 선택
	CUSTOMER_NAME                         VARCHAR2(30),                 -- 이름
	CUSTOMER_EMAIL                         VARCHAR2(50),                 -- EMAIL 주소
	CUSTOMER_PHONNUM                   VARCHAR2(30),                 -- 전화번호
	CUSTOMER_TITLE                           VARCHAR2(30),                 -- 제목
	CUSTOMER_CONTENT                     VARCHAR2(3000),              -- 내용
	CUSTOMER_PASSWARD                   NUMBER(4),                      -- 글 비밀번호
	CUSTOMER_ANSWERSITUATION         VARCHAR2(10),                   -- 답변상태
	CUSTOMER_REGISTRATIONDATE         VARCHAR2(30)                  -- 등록일
	);