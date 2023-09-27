package com.hta.movieplus.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hta.movieplus.domain.MailVO;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.service.MemberService;
import com.hta.movieplus.task.SendMail;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private MemberService memberservice;
	private PasswordEncoder passwordEncoder;
	private SendMail sendMail;
	
	@Autowired
	public MemberController(MemberService memberservice, PasswordEncoder passwordEncoder, SendMail sendMail) {
		this.memberservice = memberservice;
		this.passwordEncoder = passwordEncoder;
		this.sendMail = sendMail;
	}
	
	
	//회원가입 폼 이동
	@GetMapping("/join")
	public String memberjoin() {
		return "member/member_join_step1";
	}
	
	//회원가입폼에서 아이디 검사
	@ResponseBody
	@GetMapping("/idcheck")
	public int idcheck(@RequestParam("MEMBER_ID") String MEMBER_ID) {
		return memberservice.isId(MEMBER_ID);
	}
	
	//아이디 찾기 이동
	@GetMapping("/findid")
	public String findid() {
		return "member/member_findid";
	}
	
	//비밀번호 찾기 이동
	@GetMapping("/findpass")
	public String findpass() {
		return "member/member_findpass";
	}
	
	//마이페이지 이동
	@GetMapping("/mypage")
	public String mypage() {
		return "member/mypage_main";
	}
	
	@GetMapping("/sendEmail")
	public String sendEmail() {
		return "member";
	}
	
	
}
