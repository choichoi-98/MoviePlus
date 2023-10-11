package com.hta.movieplus.domain;

public class CartVO {

	private int CART_NUM; // 카트 번호(PK)
	private int ITEM_CODE; // 상품 코드(FK)
	private int CART_AMOUNT; // 금액
	private String CART_APPROVED; // 결제 승인 여부
	
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
	public int getCART_AMOUNT() {
		return CART_AMOUNT;
	}
	public void setCART_AMOUNT(int cART_AMOUNT) {
		CART_AMOUNT = cART_AMOUNT;
	}
	public String getCART_APPROVED() {
		return CART_APPROVED;
	}
	public void setCART_APPROVED(String cART_APPROVED) {
		CART_APPROVED = cART_APPROVED;
	}
	
}