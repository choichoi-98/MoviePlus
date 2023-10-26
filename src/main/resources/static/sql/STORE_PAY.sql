DROP TABLE STORE_PAY CASCADE CONSTRAINTS;	

CREATE TABLE STORE_PAY (
	PAY_NUM NUMBER PRIMARY KEY,
	PAY_NAME VARCHAR(35),
    	PAY_AMOUNT NUMBER,
	CART_NUM NUMBER,
	MEMBER_ID VARCHAR2(20),
	pg_token VARCHAR(50),
	FOREIGN KEY (CART_NUM) REFERENCES STORE_CART(CART_NUM) ON DELETE CASCADE,
	FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(MEMBER_ID) ON DELETE CASCADE
);

ALTER TABLE STORE_PAY
ADD PAY_DATE VARCHAR(20);

insert into STORE_PAY(PAY_NUM, PAY_APPROVED)
values(100, 'n')	

INSERT INTO STORE_PAY(PAY_NUM, PAY_APPROVED)
VALUES (101, 'n');


SELECT STORE_PAY.*, STORE_ITEM.ITEM_NAME, STORE_ITEM.ITEM_PRICE 
FROM STORE_CART
INNER JOIN STORE_ITEM ON STORE_CART.ITEM_CODE = STORE_ITEM.ITEM_CODE
WHERE STORE_CART.ITEM_CODE = '301';

SELECT *
FROM STORE_PAY
INNER JOIN STORE_ITEM ON STORE_CART.ITEM_CODE = STORE_ITEM.ITEM_CODE
WHERE STORE_CART.ITEM_CODE = '301';

success 페이지 만들기