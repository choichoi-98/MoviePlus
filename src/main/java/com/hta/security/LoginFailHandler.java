package com.hta.security;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class LoginFailHandler implements AuthenticationFailureHandler {

	private static final Logger logger = LoggerFactory.getLogger(LoginFailHandler.class);

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		
		  HttpSession session = request.getSession();
		  logger.info(exception.getMessage());
		  logger.info("로그인 실패");
		  session.setAttribute("loginfail", "loginFailMsg");
		  session.setAttribute("count", 0);
		  
		  //session.invalidate();
		  
		  response.setContentType("text/html;charset=UTF-8");
	      response.getWriter().print("<script>history.back(); </script>");
//	        response.getWriter().flush();
		  
		  
		  
//		  	response.setContentType("text/html;charset=UTF-8");
//	        response.getWriter().print("<script> alert('아이디 또는 비밀번호가 맞지 않습니다. 로그인 정보를 다시 확인하세요.'); "
//	        		+ " history.back();</script>");
//	        response.getWriter().flush();
	        
		  
//		  RequestDispatcher dispatcher = request.getRequestDispatcher("/main");
//	      dispatcher.forward(request, response);
			
	}
}
