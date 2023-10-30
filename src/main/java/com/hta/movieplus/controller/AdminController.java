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
		
		List<Total> totallist = totalService.dayReserveRate(currentdate); //일일 예매율
		List<Total> monthReserveRate = totalService.monthReserveRate(currentdate); 	//이번달 예매율
		List<Total> dayMovieseatCount = totalService.dayMovieseatCount(currentdate); //영화별 누적 관객수
		List<Total> dayTicketSalesRate = totalService.dayTicketSalesRate(currentdate); //영화별 좌석 판매율
		int dayTicketSales = totalService.dayTicketSales(currentdate);	//일일 티켓 수익
		int dayGoodsSales = totalService.dayGoodsSales(currentdate);	//일일 상품 수익
		int dayTotalSales = totalService.dayTotalSales(currentdate);	//일일 티켓 + 상품 수익
		int daySeatCount = totalService.daySeatCount(currentdate);		//일일 관객수
		
		mv.addObject("totallist", totallist);
		mv.addObject("monthReserveRate", monthReserveRate);
		mv.addObject("dayMovieseatCount", dayMovieseatCount);
		mv.addObject("dayTicketSalesRate", dayTicketSalesRate);
		mv.addObject("dayTicketSales", dayTicketSales);
		mv.addObject("dayGoodsSales", dayGoodsSales);
		mv.addObject("dayTotalSales", dayTotalSales);
		mv.addObject("daySeatCount", daySeatCount);
		
		mv.setViewName("admin/main");
		return mv;
	}
	
	//실시간 예매율 페이지
	@GetMapping("/admin/total")
	public ModelAndView totallist(String currentdate, ModelAndView mv) {
		LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		currentdate = currentdatetime.format(format);
		
		List<Total> totallist = totalService.dayReserveRate(currentdate); 
		mv.addObject("totallist", totallist);
		
		mv.setViewName("/admin/adminDayReserveRate");
		return mv;
		
	}
	
	//누적 관객수 페이지
	@GetMapping("/admin/totalcount")
	public ModelAndView dayMovieseatCount(String currentdate, ModelAndView mv) {
		LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		currentdate = currentdatetime.format(format);
		
		List<Total> dayMovieseatCount = totalService.dayMovieseatCount(currentdate); 
		mv.addObject("dayMovieseatCount", dayMovieseatCount);
		
		mv.setViewName("/admin/adminDayMovieseatCount");
		return mv;
	}
	
	//이번달 예매율 페이지
	@GetMapping("/admin/monthtotalcount")
	public ModelAndView monthReserveRate(@RequestParam(value="month" ,required=false, defaultValue="0") String month, ModelAndView mv) {
		LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String currentdate = currentdatetime.format(format);
		
		if(month.equals("1") ||month.equals("2")) {
			List<Total> monthEachReserveRate = totalService.monthEachReserveRate(month);
			mv.addObject("monthReserveRate", monthEachReserveRate);
		} else {
			List<Total> monthReserveRate = totalService.monthReserveRate(currentdate); 
			mv.addObject("monthReserveRate", monthReserveRate);
		}
		
		mv.setViewName("/admin/adminMonthReserveRate");
		return mv;
	}
	
	//좌석 판매율 페이지
	@GetMapping("/admin/ticketSalesRate")
	public ModelAndView dayTicketSalesRate(String currentdate, ModelAndView mv) {
		LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		currentdate = currentdatetime.format(format);
		
		List<Total> dayTicketSalesRate = totalService.dayTicketSalesRate(currentdate); 
		mv.addObject("dayTicketSalesRate", dayTicketSalesRate);
		
		mv.setViewName("/admin/adminDayTicketSalesRate");
		return mv;
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
