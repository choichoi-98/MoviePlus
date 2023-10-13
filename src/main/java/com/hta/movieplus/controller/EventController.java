package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/event")
public class EventController {
	
	@GetMapping("/")
	public String eventmain() {
		return "event/event_main";
	}
	
	@GetMapping("/curtaincall")
	public String curtaincall() {
		return "event/event_curtaincall";
	}
	
	@GetMapping("/eventview")
	public String eventview() {
		return "event/event_viewform";
	}
	


}
