package com.hta.movieplus.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hta.movieplus.domain.CustomerOneOnOneVO;
import com.hta.movieplus.service.CustomerService;

@Controller
@RequestMapping(value = "/customer_service")
public class CustomerController {
	
	CustomerService customerService;
	
	@Autowired
	public CustomerController(CustomerService customerService) {
		// TODO Auto-generated constructor stub
		this.customerService = customerService; 
	}
	
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@GetMapping("")
	public String home(Model model) {
		//db에서 가져오기 (mapper) 가 dao
 		model.addAttribute("message", "스프링");
		return "customer_service/customer_service_home";
	}
	
	@GetMapping("/question")
	public String question() {
		return "customer_service/customer_service_question";
	}

	@GetMapping("/notice")
	public String notice() {
		return "customer_service/customer_service_notice";
	}
	
	@GetMapping("/oneonone")
	public String oneOnOne() {
		return "customer_service/customer_service_oneonone";
	}
	
	@GetMapping("/group")
	public String group() {
		return "customer_service/customer_service_group";
	}
	
	@GetMapping("/lostitem")
	public String lostItem() {
		return "customer_service/customer_service_lostitem";
	}
	
	@GetMapping("/myinjury")
	public String myinjury() {
		return "customer_service/customer_service_myinjury";
	}

	/* 1대1 문의 데이터 저장페이지 */
	@PostMapping("/oneonone_process")
	public String oneProcess(CustomerOneOnOneVO oneonone) {
		customerService.insertOneOnOne(oneonone);
		/* customerService.insertOneOnOne(oneonone); */
		// service -> mapper(db에서 쿼리문 select, insert) 
		// 컨트롤러가 주소 처리 => 서비스 => 매퍼(select~~) 값이 생겨요 => 서비스
		/// 서비스에서 이 데이터를 가공하거나, 복잡한 로직같은거 추가하는 역할
		
		
	return "redirect:/customer_serice"; 
	}

	//form으로 데이터를 넣어서 -> 넘어오는건ㄷ
	//스프링부트에서는 csrf 토큰이란게 form안에 있어야되요 보안상의 이유로
	

	

	
}
