package com.hta.movieplus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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
	private MailVO mailVO;
	
	@Autowired
	public MemberController(MemberService memberservice, PasswordEncoder passwordEncoder, SendMail sendMail, MailVO mailVO) {
		this.memberservice = memberservice;
		this.passwordEncoder = passwordEncoder;
		this.sendMail = sendMail;
		this.mailVO = mailVO;
	}
	
	
	//회원가입 폼 이동
	@GetMapping("/join")
	public String memberjoin() {
		return "member/member_join_step1";
	}
	
	//회원가입 step1 인증메일 보내기
	@GetMapping("/sendEmail")
	public void sendEmail(@RequestParam("email") String email, HttpServletResponse resp, ModelAndView mv, HttpSession session) throws Exception {
		session.setAttribute("MEMBER_EMAIL", email);
		
		mailVO.setTo(email);
		int verifycode = mailVO.getVerifycode();
		sendMail.SendMail(mailVO);
		resp.getWriter().write(Integer.toString(verifycode));
		
		logger.info("[join1] email 값 : " + email);
	}

	//회원가입 step2
	@PostMapping("/join2")
	public String memberjoin2() {
		return "member/member_join_step2";
	}
	
	@PostMapping("/join3")
	public String memberjoin3(Model model, HttpSession session) {
		String email = (String) session.getAttribute("MEMBER_EMAIL");
		model.addAttribute("MEMBER_EMAIL", email); 
		logger.info("[join3] email 값 : " + email);
		return "member/member_join_step3";
	}
	
	@PostMapping("/join4")
	public String memberjoin4() {
		return "member/member_join_step4";
	}
	
	//회원가입폼에서 아이디 검사
	@ResponseBody
	@GetMapping("/idcheck")
	public int idcheck(@RequestParam("id") String MEMBER_ID) {
		return memberservice.isId(MEMBER_ID);
	}
	
	//회원가입 처리
	@PostMapping("/joinProcess")
	public String joinProcess(Member member, 
							  RedirectAttributes rattr,
							  Model model,
							  HttpServletRequest request) {
		//비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(member.getMEMBER_PASS());
		logger.info(encPassword);
		member.setMEMBER_PASS(encPassword);
		
		int result = memberservice.insert(member);
		
		if(result == 1) { 	//삽입이 된 경우
			model.addAttribute("member", member);
			return "/member/member_join_step4";  //step4 화면으로 이동
		} else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "회원 가입 실패");
			return "redirect:/main";  //에러페이지
		}
	}
	
	
	//아이디 찾기 이동
	@GetMapping("/findid")
	public String findid() {
		return "member/member_findid";
	}
	
	//아이디 찾기 처리
	@PostMapping("/findidProcess")
	public ModelAndView findidProcess(@RequestParam("MEMBER_ID") String MEMBER_ID,
									  @RequestParam("MEMBER_BIRTH") String MEMBER_BIRTH,
									  @RequestParam("MEMBER_PHONENO") String MEMBER_PHONENO,
									  ModelAndView mv, HttpServletRequest request) {
		Member m = memberservice.findId(MEMBER_ID, MEMBER_ID, MEMBER_ID);
		
		if(m!=null) {
			mv.addObject("MEMBERINFO", m);
		} else {
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "해당 정보가 없습니다.");
			mv.setViewName("/member/findid");
		}
		return mv;
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
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}
	
	
}
