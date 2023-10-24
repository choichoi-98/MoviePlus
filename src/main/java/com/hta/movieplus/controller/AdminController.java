package com.hta.movieplus.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.service.ManageMemberService;

@Controller
public class AdminController {
	
	ManageMemberService manageMemberService;
	
	public AdminController(ManageMemberService manageMemberService) {
		// TODO Auto-generated constructor stub
		this.manageMemberService = manageMemberService;
	}
	
	@GetMapping("/admin")
	public String siteAdminMainView() {

		return "admin/main";
	}

	@GetMapping("/admin/manageMember")
	public String manageMemberView(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
									@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword
									, Model model) {
		int memberCount = manageMemberService.getCountByMember();

		Map<String, Object> paginationDataMap = manageMemberService.pagination(page);
		List<Member> memberList = manageMemberService.getMemberList(keyword, page, (int) paginationDataMap.get("limit"));

		

		// 페이지네이션
		model.addAllAttributes(paginationDataMap);

		model.addAttribute("memberCount", memberList.size());
		model.addAttribute("memberList", memberList);
		
		return "admin/manageMember";
	}
	
	@GetMapping("/admin/deleteMember")
	public String deleteMemberAction(int memberNum) {
		manageMemberService.deleteMemberById(memberNum);
		
		return "redirect:/admin/manageMember";
	}

	
}
