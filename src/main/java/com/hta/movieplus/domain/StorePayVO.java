package com.hta.movieplus.domain;

public class StorePayVO {

	private int PAY_NUM; // 카트 번호(PK)
	private String PAY_NAME; // 상품 코드(FK)
	private int PAY_AMOUNT; // 금액
	private String pg_token;
	private String MEMBER_ID;
//	private String CART_APPROVED; // 결제 승인 여부

	public int getPAY_NUM() {
		return PAY_NUM;
	}
	public void setPAY_NUM(int pAY_NUM) {
		PAY_NUM = pAY_NUM;
	}
	public String getPAY_NAME() {
		return PAY_NAME;
	}
	public void setPAY_NAME(String pAY_NAME) {
		PAY_NAME = pAY_NAME;
	}
	public int getPAY_AMOUNT() {
		return PAY_AMOUNT;
	}
	public void setPAY_AMOUNT(int pAY_AMOUNT) {
		PAY_AMOUNT = pAY_AMOUNT;
	}
	public String getPg_token() {
		return pg_token;
	}
	public void setPg_token(String pg_token) {
		this.pg_token = pg_token;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	
}