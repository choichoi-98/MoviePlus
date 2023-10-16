package com.hta.movieplus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hta.movieplus.service.NoticeService;

@Controller
public class AdminNoticeController {
	
	NoticeService noticeService;
	
	@Autowired
	public AdminNoticeController(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@GetMapping("/admin/notice")
	public String siteAdminNotice() {
		return "admin/addNotice";
	}
	
	@GetMapping("/admin/noticelist")
	public String siteAdminNoticeList() {
		return "admin/noticeList";
	}
	
	@GetMapping("/admin/noticedetail")
	public String siteAdminNoiceDetail() {
		return "admin/noticeDetail";
	}
	
	@GetMapping("/admin/modify")
	public String siteAdminModify() {
		return "admin/modifyQuestion";
	}
	
}
/*
 * @PostMapping("/notice_insert") public String noticeInsert() {
 * 
 * noticeService. insertNoticeVO() } }
 */
