package com.hta.movieplus.controller;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private MemberService memberservice;
	
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mv, @CookieValue(value="remeber-me", required=false) Cookie readCookie,
							  HttpSession session, Principal userPrincipal) {
			if(readCookie != null) {
				logger.info("저장된 아이디 : " + userPrincipal.getName());	//로그인한 아이디 값 
				mv.setViewName("redirect:/board/list");
			}
			return mv;
		
	}
	
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String join() {
		return "member/member_joinForm";
	}

}
