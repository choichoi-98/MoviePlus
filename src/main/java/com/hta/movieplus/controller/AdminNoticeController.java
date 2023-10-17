package com.hta.movieplus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.service.NoticeService;

@Controller
public class AdminNoticeController {

	NoticeService noticeService;

	@Autowired
	public AdminNoticeController(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	@GetMapping("/admin/noticewrite")
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

	@PostMapping("/notice_insert") 
	public String noticeInsert(NoticeVO notice) {
		noticeService.insertNoticeVO(notice);
		return "admin/noticeList";
	}
}
