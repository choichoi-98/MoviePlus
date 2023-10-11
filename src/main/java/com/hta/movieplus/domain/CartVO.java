package com.hta.movieplus.domain;

import java.sql.Date;

public class CartVO {

	private int CART_NUM; //카트 번호(PK)
	private StoreVO ITEM_CODE; // 상품 코드(FK)
	private int CART_AMOUNT; // 금액
	private String CART_APPROVED; // 결제 승인 여부
	
}