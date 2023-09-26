package com.hta.movieplus.controller;

import java.security.Principal;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private MemberService memberservice;
	private PasswordEncoder passwordEncoder;
	//private SendMail sendMail;
	
	@Autowired
	public MemberController(MemberService memberservice, PasswordEncoder passwordEncoder) {
		this.memberservice = memberservice;
		this.passwordEncoder = passwordEncoder;
		//this.sendMail = sendMail;
	}
	
//	//로그인 폼으로 이동
//	@RequestMapping(value="/login", method = RequestMethod.GET)
//	public ModelAndView login(ModelAndView mv, @CookieValue(value="remeber-me", required=false) Cookie readCookie,
//							  HttpSession session, Principal userPrincipal) {
//			if(readCookie != null) {
//				logger.info("저장된 아이디 : " + userPrincipal.getName());	//로그인한 아이디 값 
//				mv.setViewName("redirect:/board/list");
//			} else {
//				mv.setViewName("member/member_loginForm");
//				mv.addObject("loginfail", session.getAttribute("loginfail"));
//				session.removeAttribute("loginfail");
//			}
//			return mv;
//	}
	
	//회원가입 폼 이동
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public String join() {
		return "member/member_joinForm";
	}
	
	//회원가입폼에서 아이디 검사
	@ResponseBody
	@RequestMapping(value="/idcheck", method=RequestMethod.GET)
	public int idcheck(@RequestParam("MEMBER_ID") String MEMBER_ID) {
		return memberservice.isId(MEMBER_ID);
	}
	

}
