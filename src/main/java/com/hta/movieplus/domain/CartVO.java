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
	private String MEMBER_ID;
	private int ITEM_CNT;
	
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
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public int getITEM_CNT() {
		return ITEM_CNT;
	}
	public void setITEM_CNT(int iTEM_CNT) {
		ITEM_CNT = iTEM_CNT;
	}
}