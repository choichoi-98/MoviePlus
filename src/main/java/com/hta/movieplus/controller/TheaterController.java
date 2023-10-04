package com.hta.movieplus.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.Manager;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.service.TheaterService;


@Controller
public class TheaterController {
	
	private TheaterService theaterservice;
	private static final Logger logger = LoggerFactory.getLogger(TheaterController.class);

	@Autowired
	public TheaterController(TheaterService theaterService) {
		// TODO Auto-generated constructor stub
		this.theaterservice = theaterService;
	}
	
	@GetMapping("/theater")
	public String theaterMainView() {
		return "theater/theater_main";
	}
	
	@GetMapping("/theater/detail")
	public String theaterDetailView() {
		return "theater/theater_detail";
	}
		
	//어드민 극장 관리
	@GetMapping("/admin/managetheater")
	public ModelAndView manageTheaterView(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {
		
		int theaterCount = theaterservice.getCountByTheater();
		
		Map<String, Object> paginationDataMap = theaterservice.pagination(page);
		List<Theater> theaterList = theaterservice.getTheaterList(page, (int) paginationDataMap.get("limit"));

		mv.setViewName("admin/manageTheater");
		
		//페이지네이션
		mv.addAllObjects(paginationDataMap);
		
		mv.addObject("theaterCount", theaterCount);
		mv.addObject("theaterList", theaterList);
		
		return mv;
	}	
	
	@GetMapping("/admin/addtheater")
	public ModelAndView addTheaterView(ModelAndView mv) {
		String managerId = theaterservice.getManagerId();
		
		mv.setViewName("admin/addTheater");
		mv.addObject("managerId", managerId);
		return mv;
	}	
	
	@PostMapping("/admin/addTheaterAction")
	public String addTheaterAction(Theater theater, Manager manager) {
		
		theaterservice.addTheater(theater, manager);
		
		return "redirect:/admin/managetheater";
	}
	
	@GetMapping("/admin/deleteTheaterAction")
	public String deleteTheaterAction(int num) {
		theaterservice.deleteTheater(num);
		
		
		return "redirect:/admin/managetheater";
	}
	
	@GetMapping("/admin/modifytheater")
	public ModelAndView modifyTheaterAction(@RequestParam(value = "num") int num,
			ModelAndView mv) {
		
		Theater theater = theaterservice.getTheaterById(num);
		
		mv.addObject(theater);
		mv.setViewName("/admin/modifyTheater");
		
		return mv;
	}
	
	@PostMapping("/admin/modifyTheaterAction")
	public String modifyTheaterAction(Theater theater, String resetPassCheck) {
		theaterservice.modifyTheater(theater);
		//비밀번호 초기화 관련 로직
		if(resetPassCheck.equals("checked")) {
			theaterservice.resetManagerPassword(theater.getTHEATER_MANAGER_ID());
		}
		
		
		return "redirect:/admin/managetheater";
	}
	
	@GetMapping("/admin/changeStatusTheaterAction")
	public String changeStatusTheaterAction(int num, String status) {
		theaterservice.changeStatusTheater(num, status);
		
		
		return "redirect:/admin/managetheater";
	}
	
	//어드민 극장 관리


}
