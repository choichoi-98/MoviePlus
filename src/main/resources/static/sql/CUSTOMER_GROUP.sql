고객센터 대관&문의 테이블
create table CUSTOMER_GROUP(
GROUP_NUMBER         NUMBER PRIMARY KEY,  -- PK
GROUP_REGION          VARCHAR2(30),       -- 지역명
GROUP_THEATER        VARCHAR2(30),        -- 영화관명
GROUP_DATE             VARCHAR2(20),        -- 대관일
GROUP_AUDIENCENUM VARCHAR2(10),        -- 인원수
GROUP_NAME            VARCHAR2(20),        -- 작성자 이름
GROUP_PHONNUM      VARCHAR2(15),        -- 작성자 연락처
GROUP_EMAIL            VARCHAR2(30),        -- 작성자 EMAIL
GROUP_TITLE             VARCHAR2(300),       -- 제목
GROUP_CONTENT        VARCHAR2(4000)     -- 내용
);