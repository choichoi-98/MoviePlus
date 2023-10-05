package com.hta.movieplus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.api.RestApi.MovieDetailApi;
import com.hta.movieplus.service.MovieServiceImpl;

@Controller
@RequestMapping(value = "/customer_service")
public class CustomerController {

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

	

	

	

	
}
