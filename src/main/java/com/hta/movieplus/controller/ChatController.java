package com.hta.movieplus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {
	
	@RequestMapping("/chating")
	public ModelAndView chatting(ModelAndView mv) {
		
		mv.setViewName("chat/chat");
		
		return mv;
	}
}
