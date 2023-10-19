package com.hta.movieplus.domain;

public class StoreCartDTO {

	private int ITEM_CODE;
	private String ITEM_MENU;
	private String ITEM_NAME;
	private int ITEM_PRICE;
	private int ITEM_CNT;
	
	public String getITEM_MENU() {
		return ITEM_MENU;
	}
	public void setITEM_MENU(String iTEM_MENU) {
		ITEM_MENU = iTEM_MENU;
	}
	public int getITEM_CODE() {
		return ITEM_CODE;
	}
	public void setITEM_CODE(int iTEM_CODE) {
		ITEM_CODE = iTEM_CODE;
	}
	public String getITEM_NAME() {
		return ITEM_NAME;
	}
	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}
	public int getITEM_PRICE() {
		return ITEM_PRICE;
	}
	public void setITEM_PRICE(int iTEM_PRICE) {
		ITEM_PRICE = iTEM_PRICE;
	}
	public int getITEM_CNT() {
		return ITEM_CNT;
	}
	public void setITEM_CNT(int iTEM_CNT) {
		ITEM_CNT = iTEM_CNT;
	}
	
}