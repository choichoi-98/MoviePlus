package com.hta.movieplus.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.constant.TheaterLocationEnum;
import com.hta.movieplus.domain.CustomerOneOnOneVO;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.service.CustomerService;
import com.hta.movieplus.service.NoticeService;
import com.hta.movieplus.service.TheaterService;

@Controller
@RequestMapping(value = "/customer_service")
public class CustomerController {

	/* 컨트롤러 서비스 연결부분 */
	CustomerService customerService;
	NoticeService noticeservice;
	TheaterService theaterservice;
	

	@Autowired /* 생성자에 의존성주입 초기화 이미 만들어진객체를 new없이 받음 */
	public CustomerController(CustomerService customerService, NoticeService noticeservice, TheaterService theaterservice) {
		this.customerService = customerService;
		this.noticeservice = noticeservice;
		this.theaterservice = theaterservice;
	}

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);
	
	//홈화면 이동 공지사항 전체 정보 가지고오기
	@GetMapping("")
	public String home(Model model) {
		List<NoticeVO> totalnoticelist = noticeservice.getTotalNoticeList();
		model.addAttribute("TotalNoticeList", totalnoticelist);
		return "customer_service/customer_service_notice_total";
	}
	
	@GetMapping("/adminnotice")
	public String adminNotice(Model model) {
		List<NoticeVO> adminnotice = noticeservice.getNoticelist("전체");
		model.addAttribute("AdminNotice" ,adminnotice);
		return "customer_service/customer_service_notice_admin";
	}
	
	@GetMapping("/regionnotice")
	public String regionNotice(Model model) {
		List<NoticeVO> regionnotice = noticeservice.getNoticelistExceptEntire();
		model.addAttribute("RegionNotice", regionnotice);
		return "customer_service/customer_service_notice_region";
	}
	
	@GetMapping("/oneonone")
	public ModelAndView oneOnOne(ModelAndView mv) {
		mv.addObject("locationList", TheaterLocationEnum.values());
		mv.setViewName("customer_service/customer_service_oneonone");
		return mv;
	}

	@GetMapping("/myinjury")
	public String myinjury(@AuthenticationPrincipal Member member, Model model) {
		List<CustomerOneOnOneVO> myinjury = customerService.getMyInjury(member.getMEMBER_NUM());
		model.addAttribute("MyInjury", myinjury);
		return "customer_service/customer_service_myinjury"; // 리턴이 없어도되나요? 안되는거같음..
	}

	/* 1대1 문의 데이터 저장페이지 */
	@PostMapping("/oneonone_process") //member는 MemberVO의 객체로 세션값을 가지고 있음 
	public String oneProcess(@AuthenticationPrincipal Member member, CustomerOneOnOneVO oneonone) {
		oneonone.setCUSTOMER_PHONNUM(
				oneonone.getCUSTOMER_PHONNUM1() + oneonone.getCUSTOMER_PHONNUM2() + oneonone.getCUSTOMER_PHONNUM3());
		
		oneonone.setMEMBER_NUM(member.getMEMBER_NUM());
		customerService.insertOneOnOne(oneonone);
		// 데이터는 컨트롤러에 있는데 서비스에 있는 도구를 쓰는거에요

		return "redirect:/customer_service/myinjury";
	}
	
	@ResponseBody
	@PostMapping("/getTheaterListAjax")
	public List<Theater> getTheaterListAjax(String location){
		
		return theaterservice.getTheaterListByLocation(location);
	}
	
	@GetMapping("/myinjurydetail")
	public String MyInjuryDetail(int detailnum, Model model) {
		CustomerOneOnOneVO myinjurydetail = customerService.getDetailByNum(detailnum);
		model.addAttribute("MyInjuryDetail",myinjurydetail);
		return "customer_service/customer_service_myinjury_detail";
	}
	
	
}