package com.hta.movieplus.domain;

public class CouponVO {
	
	private int COUPON_NUM; // 쿠폰 번호(PK)
	private String COUPON_CODE; // 쿠폰 코드(FK)
	private String COUPON_TYPE;
	private int COUPON_VALUE;
	private String COUPON_EX;
	
	public int getCOUPON_NUM() {
		return COUPON_NUM;
	}
	public void setCOUPON_NUM(int cOUPON_NUM) {
		COUPON_NUM = cOUPON_NUM;
	}
	public String getCOUPON_CODE() {
		return COUPON_CODE;
	}
	public void setCOUPON_CODE(String cOUPON_CODE) {
		COUPON_CODE = cOUPON_CODE;
	}
	public String getCOUPON_TYPE() {
		return COUPON_TYPE;
	}
	public void setCOUPON_TYPE(String cOUPON_TYPE) {
		COUPON_TYPE = cOUPON_TYPE;
	}
	public int getCOUPON_VALUE() {
		return COUPON_VALUE;
	}
	public void setCOUPON_VALUE(int cOUPON_VALUE) {
		COUPON_VALUE = cOUPON_VALUE;
	}
	public String getCOUPON_EX() {
		return COUPON_EX;
	}
	public void setCOUPON_EX(String cOUPON_EX) {
		COUPON_EX = cOUPON_EX;
	}
	
}