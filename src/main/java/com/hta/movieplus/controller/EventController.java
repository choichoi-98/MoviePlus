package com.hta.movieplus.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.hta.movieplus.service.EventService;

@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Value("${my.savefolder}")
	private String saveFolder;
	private EventService eventservice;
	
	@Autowired
	public EventController(EventService eventservice) {
		this.eventservice = eventservice;
	}
	
	
	@GetMapping("/event")
	public String eventmain() {
		return "event/event_main";
	}
	
	@GetMapping("/event/curtaincall")
	public String curtaincall() {
		return "event/event_curtaincall";
	}
	
	@GetMapping("/event/eventview")
	public String eventview() {
		return "event/event_viewform";
	}
	
	@GetMapping("/event/eventwrite")
	public String eventwrite() {
		return "event/event_write";
	}
	
	@GetMapping("/event/eventwrite2")
	public String eventwrite2() {
		return "admin/addEvent";
	}
	
	
	


}
