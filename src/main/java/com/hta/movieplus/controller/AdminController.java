package com.hta.movieplus.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Total;
import com.hta.movieplus.service.ManageMemberService;
import com.hta.movieplus.service.TotalService;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	
	ManageMemberService manageMemberService;
	TotalService totalService;
	
	public AdminController(ManageMemberService manageMemberService, 
							TotalService totalService) {
		this.manageMemberService = manageMemberService;
		this.totalService = totalService;
	}
	
	
	//관리자페이지 - 대쉬보드
	@GetMapping("/admin")
	public ModelAndView siteAdminMainView(String currentdate, ModelAndView mv) {
		LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		currentdate = currentdatetime.format(format);
		
		List<Total> totallist = totalService.dayReserveRate(currentdate);
		int daySeatCount = totalService.daySeatCount(currentdate);
		mv.addObject("totallist", totallist);
		mv.addObject("daySeatCount", daySeatCount);
		mv.setViewName("admin/main");
		return mv;
	}
	
	@GetMapping("/admin/test")
	public String admintest() {
		
		return "/admin/adminstatistic";
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
