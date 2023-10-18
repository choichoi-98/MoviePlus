package com.hta.movieplus.domain;

public class CartVO {
	
	/* 이 형식에 맞게 변경하기 
	 * CREATE TABLE STORE_CART ( CART_NUM NUMBER PRIMARY KEY, ITEM_CODE NUMBER,
	 * MEMBER_ID VARCHAR2(20), FOREIGN KEY (ITEM_CODE) REFERENCES
	 * STORE_ITEM(ITEM_CODE) ON DELETE CASCADE, FOREIGN KEY (MEMBER_ID) REFERENCES
	 * MEMBER(MEMBER_ID) ON DELETE CASCADE );
	 */ 
	
	private int CART_NUM; // 카트 번호(PK)
	private int ITEM_CODE; // 상품 코드(FK)
	
	public int getCART_NUM() {
		return CART_NUM;
	}
	public void setCART_NUM(int cART_NUM) {
		CART_NUM = cART_NUM;
	}
	public int getITEM_CODE() {
		return ITEM_CODE;
	}
	public void setITEM_CODE(int iTEM_CODE) {
		ITEM_CODE = iTEM_CODE;
	}
	
}