package com.hta.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.service.MemberService;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);
	
	@Autowired
	private MemberService memberservice;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		logger.info("로그인 성공 : LoginSuccessHandler ");
		
		HttpSession session = request.getSession();
		//session.setAttribute("loginUser", authentication.getName());
		//session.setAttribute("MEMBER_ID", MEMBER_ID);
		
		/*
		 * String MEMBER_ID = authentication.getName(); Member m =
		 * memberservice.memberinfo(MEMBER_ID);
		 * 
		 * if(m != null) { session.setAttribute("memberInfo", m); }
		 */
		
		
//		session.removeAttribute("loginfail");
//		String url = request.getContextPath() +  "/main";
		
		String url = request.getHeader("Referer"); // Referer : 세션에 저장된 이전 주소
		response.sendRedirect(url);
		
	}

}
