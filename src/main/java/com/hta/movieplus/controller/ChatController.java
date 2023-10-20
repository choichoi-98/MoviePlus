package com.hta.movieplus.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {
   
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);

	@RequestMapping("/chating")
	public ModelAndView chatting(ModelAndView mv) {
		
		mv.setViewName("chat/chat");
		logger.info("ChatController");
		return mv;
	}
}
