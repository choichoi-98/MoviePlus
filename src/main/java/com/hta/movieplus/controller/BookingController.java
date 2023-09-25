package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/booking")
public class BookingController {
	
	@GetMapping("/")
	public String booking() {
		return "booking/booking_main";
	}
	

}
