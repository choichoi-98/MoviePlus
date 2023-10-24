package com.hta.movieplus.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.constant.TheaterLocationEnum;
import com.hta.movieplus.domain.FavoriteTheater;
import com.hta.movieplus.domain.Manager;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.domain.TimeTableDate;
import com.hta.movieplus.service.SchedulingService;
import com.hta.movieplus.service.TheaterManagerService;
import com.hta.movieplus.service.TheaterService;

@Controller
public class TheaterController {

	private TheaterService theaterservice;
	private TheaterManagerService theaterManagerService;
	private SchedulingService schedulingService;
	private static final Logger logger = LoggerFactory.getLogger(TheaterController.class);

	@Autowired
	public TheaterController(TheaterService theaterService, TheaterManagerService theaterManagerService,
			SchedulingService schedulingService) {
		// TODO Auto-generated constructor stub
		this.theaterservice = theaterService;
		this.theaterManagerService = theaterManagerService;
		this.schedulingService = schedulingService;
	}

	@GetMapping("/theater")
	public ModelAndView theaterMainView(ModelAndView mv) {

		List<Theater> theaterList = theaterservice.getAllTheaterList();

		mv.addObject("theaterList", theaterList);
		mv.addObject("locationList", TheaterLocationEnum.values());
		mv.setViewName("theater/theater_main");
		return mv;
	}

	@GetMapping("/theater/detail")
	public ModelAndView theaterDetailView(@RequestParam(value = "theaterId", required = true) int theaterId,
			ModelAndView mv, Principal principal) {
		// 메뉴바 부분
		List<TimeTableDate> dateList = schedulingService.getDateList();
		List<Theater> theaterList = theaterservice.getAllTheaterList();
		Theater theater = theaterservice.getTheaterById(theaterId);

		mv.addObject("theaterList", theaterList);
		mv.addObject("locationList", TheaterLocationEnum.values());
		mv.addObject("dateList", dateList);
		// 메뉴바 부분

		mv.addObject("theater", theater);
		mv.addObject("ajax_theaterId", theaterId);
		mv.setViewName("theater/theater_detail");

		return mv;
	}

	// 어드민 극장 관리
	@GetMapping("/admin/managetheater")
	public ModelAndView manageTheaterView(@RequestParam(value = "page", defaultValue = "1", required = false) int page,
			ModelAndView mv) {

		int theaterCount = theaterservice.getCountByTheater();

		Map<String, Object> paginationDataMap = theaterservice.pagination(page);
		List<Theater> theaterList = theaterservice.getTheaterList(page, (int) paginationDataMap.get("limit"));

		mv.setViewName("admin/manageTheater");

		// 페이지네이션
		mv.addAllObjects(paginationDataMap);

		mv.addObject("theaterCount", theaterCount);
		mv.addObject("theaterList", theaterList);

		return mv;
	}

	@GetMapping("/admin/addtheater")
	public ModelAndView addTheaterView(ModelAndView mv) {
		String managerId = theaterservice.getManagerId();

		mv.addObject("locationList", TheaterLocationEnum.values());
		mv.addObject("managerId", managerId);
		mv.setViewName("admin/addTheater");
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
	public ModelAndView modifyTheaterAction(@RequestParam(value = "num") int num, ModelAndView mv) {

		Theater theater = theaterservice.getTheaterById(num);

		mv.addObject("locationList", TheaterLocationEnum.values());
		mv.addObject(theater);
		mv.setViewName("/admin/modifyTheater");

		return mv;
	}

	@PostMapping("/admin/modifyTheaterAction")
	public String modifyTheaterAction(Theater theater, String resetPassCheck) {
		theaterservice.modifyTheater(theater);
		// 비밀번호 초기화 관련 로직
		if (resetPassCheck.equals("checked")) {
			theaterservice.resetManagerPassword(theater.getTHEATER_MANAGER_ID());
		}

		return "redirect:/admin/managetheater";
	}

	@GetMapping("/admin/changeStatusTheaterAction")
	public String changeStatusTheaterAction(int num, String status) {
		theaterservice.changeStatusTheater(num, status);

		return "redirect:/admin/managetheater";
	}

	// 어드민 극장 관리

	// 자주 가는 영화관

	@ResponseBody
	@PostMapping("theater/getLocationList")
	public List<String> getLocationList() {
		List<String> locationList = new ArrayList<String>();
		
		for(TheaterLocationEnum loc : TheaterLocationEnum.values()) {
			locationList.add(loc.getValue());
			
		}
		
		return locationList;
	}

	@ResponseBody
	@PostMapping("theater/getTheaterListByLocation")
	public List<Theater> getTheaterListByLocation(String location) {

		return theaterservice.getTheaterListByLocation(location);
	}

	@ResponseBody
	@PostMapping("theater/getFavoriteTheaterList")
	public List<FavoriteTheater> getFavoriteTheaterList(Principal principal) {
		List<FavoriteTheater> favList = null;
		String userId = principal.getName();

		if (userId != null) {
			favList = theaterservice.getFavoriteTheaterListById(userId);
		}

		return favList;
	}

	@ResponseBody
	@PostMapping("theater/checkFavoriteTheater")
	public int checkFavoriteTheater(Principal principal, int theaterId) {

		String userId = principal.getName();
		int favTheaterChk = theaterservice.checkFavoriteTheater(theaterId, userId);

		return favTheaterChk;
	}

	@ResponseBody
	@PostMapping("theater/addFavoriteTheater")
	public int addFavoriteTheater(Principal principal, int theaterId) {

		String userId = principal.getName();
		return theaterservice.addFavoriteTheater(theaterId, userId);
	}

	@ResponseBody
	@PostMapping("theater/deleteFavoriteTheater")
	public int deleteFavoriteTheater(Principal principal, int theaterId) {

		String userId = principal.getName();
		return theaterservice.deleteFavoriteTheater(theaterId, userId);
	}
	
	@ResponseBody
	@PostMapping("theater/updateFavoriteTheaterWithModal")
	public int updateFavoriteTheaterWithModal(@AuthenticationPrincipal Member member, int[] theaterId) {
		if(theaterId == null) {
			return theaterservice.deleteFavoriteTheaterByMemberId(member.getMEMBER_NUM());
		}
		
		return theaterservice.updateFavoriteTheaterWithModal(member.getMEMBER_NUM(), theaterId);
	}
	
	@ResponseBody
	@PostMapping("theater/getFavoriteCount")
	public int getFavoriteCount(@AuthenticationPrincipal Member member) {
		
		return theaterservice.getCountFavoriteTheater(member.getMEMBER_ID());
	}

}
