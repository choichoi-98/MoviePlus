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

	/* 컨트롤러 서비스 연결부분 */
	CustomerService customerService;

	@Autowired /* 생성자에 의존성주입 */
	public CustomerController(CustomerService customerService) {
		// TODO Auto-generated constructor stub
		this.customerService = customerService;
	}

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@GetMapping("")
	public String home(Model model) {
		// db에서 가져오기 (mapper) 가 dao
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
		//데이터는 컨트롤러에 있는데 서비스에 있는 도구를 쓰는거에요 
 
		return "redirect:/customer_service";
	}
}