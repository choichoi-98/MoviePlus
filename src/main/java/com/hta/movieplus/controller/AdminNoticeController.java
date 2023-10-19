package com.hta.movieplus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@GetMapping("/admin/noticelist")
	public String siteAdminNoticeList(Model model) {
		List<NoticeVO> list = noticeService.getNoticelist("전체");
		model.addAttribute("list2", list); // admin/noticeList 객체를담아서보냄 list2
		return "admin/noticeList";
		/* 내가구한 객체를 페이지 사용할수 있게 (리턴) */
	}

	@GetMapping("/admin/gonoticewrite")
	public String goNoticeWrite() {
		return "admin/addNotice";
	}

	@PostMapping("/admin/noticewrite")
	public String noticeWrite(NoticeVO notice) {
		noticeService.noticeWrite(notice);
		return "redirect:/admin/noticelist";
	}

	@GetMapping("admin/gonoticemodify")
	public String gonoticeModify(int noticemodify, Model model) {
		NoticeVO notice = noticeService.getNoticeModify(noticemodify);
		model.addAttribute("notice", notice); /* model 안에 notice 벨류 */
		return "admin/noticeModify";
	}
	
	@GetMapping("/admin/noticedelete")
	public String noticeDelete(int noticenum) {
		noticeService.deleteNoticeVO(noticenum);
		return "redirect:/admin/noticelist";
	}
	
	
	
	
	
	
	
	@PostMapping("admin/noticemodify")
	public String noticeModify(NoticeVO modify) {
		noticeService.noticeModify(modify);
		return "redirect:/admin/noticelist";
	}
	
	/*
	 * @PostMapping("admin/noticemodify") public int noticeModify(int moidfy) {
	 * noticeService.noticeModify(int); return "redirect:/admin/noticeList; }
	 */
	


	
}