DROP TABLE STORE_ITEM CASCADE CONSTRAINTS;	

CREATE TABLE STORE_ITEM (
	ITEM_CODE NUMBER PRIMARY KEY,
	ITEM_MENU VARCHAR2(20),
    	ITEM_NAME VARCHAR2(20),
    	ITEM_PRICE NUMBER,
    	ITEM_DETAIL VARCHAR2(2000),
    	ITEM_FILE varchar2(50),-- 첨부될 파일명(가공)
  	ITEM_ORIGINAL  varchar2(50) -- 첨부 파일명
);


ALTER TABLE STORE_ITEM
DROP COLUMN ITEM_FILE;

ALTER TABLE STORE_ITEM
DROP COLUMN ITEM_ORIGINAL;

ALTER TABLE STORE_ITEM
MODIFY ITEM_NAME VARCHAR2(30);


-- 그런 다음 새로운 두 열 추가
ALTER TABLE STORE_ITEM
ADD ITEM_FILE VARCHAR2(150);

ALTER TABLE STORE_ITEM
ADD ITEM_PATH VARCHAR2(300);


insert into store_item(item_code, item_menu, item_name, item_price)
values(101, 'ticket', 'Ticket Premium', 30000); 

insert into store_item(item_code, item_menu, item_name, item_price)
values(102, 'ticket', 'Movie Ticket VIP', 15000);

insert into store_item(item_code, item_menu, item_name, item_price)
values(103, 'ticket', 'Event Ticket', 25000); 

insert into store_item(item_code, item_menu, item_name, item_price)
values(201, 'snack', 'Popcorn Large', 8000); 

insert into store_item(item_code, item_menu, item_name, item_price)
values(202, 'snack', 'Soda Medium', 5000); 

insert into store_item(item_code, item_menu, item_name, item_price)
values(203, 'snack', 'Candy Bar', 3000); 

insert into store_item(item_code, item_menu, item_name, item_price)
values(301, 'voucher', 'Shopping Voucher', 20000); 

insert into store_item(item_code, item_menu, item_name, item_price)
values(302, 'voucher', 'Restaurant Voucher', 25000); 

insert into store_item(item_code, item_menu, item_name, item_price)
values(303, 'voucher', 'Spa Voucher', 35000); 

insert into store_item(item_code, item_menu, item_name, item_price)
values(401, 'point', '1000 Points', 10000);

insert into store_item(item_code, item_menu, item_name, item_price)
values(402, 'point', '5000 Points', 45000); 
