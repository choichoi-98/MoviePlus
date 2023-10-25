package com.hta.movieplus.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.service.MovieServiceImpl;
import com.hta.movieplus.service.NoticeService;


@Controller
public class MainController {

   private static final Logger logger = LoggerFactory.getLogger(MainController.class);
   
   private MovieServiceImpl movieServiceImpl;
   private NoticeService noticeservice;
   
   @Autowired
   public MainController(MovieServiceImpl movieServiceImpl, NoticeService noticeservice) {
      this.movieServiceImpl = movieServiceImpl;
      this.noticeservice = noticeservice;
   }
   
   
   @RequestMapping("/main")
      public ModelAndView Main( ModelAndView mv
                        , @AuthenticationPrincipal Member member, HttpSession session) throws Exception{

		//---------------------------------------------------------------------------------
	   	List<NoticeVO> noticetype = noticeservice.getNoticelist("전체");
	   	mv.addObject("NoticeType", noticetype);
	   	//---------------------------------------------------------------------------------
	   	
	   	
        if(session.getAttribute("loginfail")!= null ) {
           session.setAttribute("count", (int) session.getAttribute("count")+1);   
        }
        
        if(session.getAttribute("count")!= null) {
           int count = (int) session.getAttribute("count");   
           if(count == 2) {
              session.removeAttribute("loginfail");
           }
        }
         
         if (member != null) { //로그인 한 경우
            String memberId =  member.getMEMBER_ID();
              logger.info("로그인 한 경우 메인"+memberId);
              List<Movie> movieList = movieServiceImpl.getPlayingMovieLoginMain(memberId);
              mv.addObject("movieList", movieList);
              
          } else {
              List<Movie> movieList = movieServiceImpl.getPlayingMovieMain();
              mv.addObject("movieList", movieList);
          }

          return mv;
      }
   	
   
}