package com.hta.movieplus.domain;

import org.springframework.web.multipart.MultipartFile;

public class StoreVO {

	private int ITEM_CODE;
	private String ITEM_MENU;
	private String ITEM_NAME;
	private int ITEM_PRICE;
	private String ITEM_DETAIL;
	private String ITEM_FILE;
	private String ITEM_PATH;
	private MultipartFile uploaditemfile;
	
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
	public String getITEM_DETAIL() {
		return ITEM_DETAIL;
	}
	public void setITEM_DETAIL(String iTEM_DETAIL) {
		ITEM_DETAIL = iTEM_DETAIL;
	}
	public MultipartFile getUploaditemfile() {
		return uploaditemfile;
	}
	public void setUploaditemfile(MultipartFile uploaditemfile) {
		this.uploaditemfile = uploaditemfile;
	}
	public String getITEM_FILE() {
		return ITEM_FILE;
	}
	public void setITEM_FILE(String iTEM_FILE) {
		ITEM_FILE = iTEM_FILE;
	}
	public String getITEM_PATH() {
		return ITEM_PATH;
	}
	public void setITEM_PATH(String iTEM_PATH) {
		ITEM_PATH = iTEM_PATH;
	}
}