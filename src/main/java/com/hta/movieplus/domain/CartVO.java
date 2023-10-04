package com.hta.movieplus.domain;

import java.sql.Date;

public class CartVO {

	/*
	CREATE TABLE CART (
    	CART_NUM NUMBER PRIMARY KEY,
    	ITEM_CODE NUMBER, -- 상품 코드(FK)
    	CART_AMOUNT NUMBER,
    	CART_APPROVED VARCHAR2(5) -- 결제 승인 여부
	);

	-- 상품 코드(FK)에 대한 외래키 설정
	ALTER TABLE CART
	ADD CONSTRAINT FK_ITEM_CODE
	FOREIGN KEY (ITEM_CODE)
	REFERENCES STORE_ITEM (ITEM_CODE); 
    */
	
	private int CART_NUM; //카트 번호(PK)
	private int ITEM_CODE; // 상품 코드(FK)
	private int CART_AMOUNT; // 총 주문금액
	private String CART_APPROVED; // 결제 승인 여부
	
}