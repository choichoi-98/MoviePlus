package com.hta.movieplus.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
//	//로그인 처리
//	@RequestMapping(value="/loginProcess", method = RequestMethod.POST)
//	public String loginProcess(@RequestParam("MEMBER_ID") String MEMBER_ID,
//							   @RequestParam("MEMBER_PASS") String MEMBER_PASS,
//							   @RequestParam(value="remember", defaultValue="", required=false) String remember,
//							   HttpServletResponse response,
//							   HttpSession session,
//							   RedirectAttributes rattr) {
//		int result = memberservice.isId(MEMBER_ID, MEMBER_PASS);
//		logger.info("결과 : " + result);
//		
//		if(result == 1) { 	//로그인 성공
//			session.setAttribute("MEMBER_ID", MEMBER_ID);
//			Cookie savecookie = new Cookie("chkIdSave", MEMBER_ID);
//			if(!remember.equals("")) {
//				savecookie.setMaxAge(60*60);
//				logger.info("쿠키저장 : 60*60");
//			} else {
//				logger.info("쿠키저장 : 0");
//				savecookie.setMaxAge(0);
//			}
//			response.addCookie(savecookie);
//			
//			return "";	//로그인 성공 후 메인페이지로 이동
//		} else { 	//로그인 실패
//			rattr.addFlashAttribute("result", result);
//			return "";	//로그인 실패할 경우 로그인 페이지로 이동
//		}
//	}
//	
	
	

}
