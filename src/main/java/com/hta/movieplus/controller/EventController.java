package com.hta.movieplus.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.Event;
import com.hta.movieplus.service.EventService;

@Controller
public class EventController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Value("${my.savefolder}")
	private String saveFolder;
	private EventService eventservice;
	
	@Autowired
	public EventController(EventService eventservice) {
		this.eventservice = eventservice;
	}
	
	//이벤트 전체 페이지(메인)
	@GetMapping("/event")
	public ModelAndView eventmain(ModelAndView mv) throws Exception {
		
		List<Event> movieEventList = eventservice.getMovieEventList();
		List<Event> theaterEventList = eventservice.getTheaterEventList();
		List<Event> promotionEventList = eventservice.getPromotionEventList();
		List<Event> curtaincallEventList = eventservice.getCurtaincallEventList();
		
		mv.addObject("movieEventList", movieEventList);
		mv.addObject("theaterEventList", theaterEventList);
		mv.addObject("promotionEventList", promotionEventList);
		mv.addObject("curtaincallEventList", curtaincallEventList);
		
		mv.setViewName("event/event_main");
		
		return mv;
	}
	
	//이벤트 영화 페이지
	@GetMapping("/event/movie")
	public ModelAndView eventmovie(ModelAndView mv) {
		List<Event> movieEventList = eventservice.getMovieEventList();
		int movieEventListCount = eventservice.getMovieEventListCount();
		
		mv.addObject("movieEventList", movieEventList);
		mv.addObject("movieEventListCount", movieEventListCount);
		mv.setViewName("event/event_movie");
		return mv;
	}
	
	//이벤트 극장 페이지
	@GetMapping("/event/theater")
	public ModelAndView eventtheater(ModelAndView mv) {
		List<Event> theaterEventList = eventservice.getTheaterEventList();
		int theaterEventListCount = eventservice.getTheaterEventListCount();
		
		mv.addObject("theaterEventList", theaterEventList);
		mv.addObject("theaterEventListCount", theaterEventListCount);
		mv.setViewName("event/event_theater");
		return mv;
	}
	
	//이벤트 제휴/할인 페이지
	@GetMapping("/event/promotion")
	public ModelAndView eventpromotion(ModelAndView mv) {
		List<Event> promotionEventList = eventservice.getPromotionEventList();
		int promotionEventListCount = eventservice.getPromotionEventListCount();
		
		mv.addObject("promotionEventList", promotionEventList);
		mv.addObject("promotionEventListCount", promotionEventListCount);
		mv.setViewName("event/event_promotion");
		return mv;
	}
	
	//이벤트 시사회/무대인사 페이지
	@GetMapping("/event/curtaincall")
	public ModelAndView curtaincall(ModelAndView mv) {
		List<Event> curtaincallEventList = eventservice.getCurtaincallEventList();
		int curtaincallEventListCount = eventservice.getCurtaincallEventListCount();
		
		mv.addObject("curtaincallEventList", curtaincallEventList);
		mv.addObject("curtaincallEventListCount", curtaincallEventListCount);
		mv.setViewName("event/event_curtaincall");
		return mv;
	}
	
	
	
	
	//관리자 - 이벤트 추가페이지 이동
	@GetMapping("/admin/addEvent")
	public String eventwrite2() {
		return "admin/addEvent";
	}
	
	//관리자 - 이벤트 추가 프로세스
	@PostMapping("/admin/eventInsert")
	public String insertevent (Event event,Model model, HttpServletRequest request) throws Exception {
		
		MultipartFile uploadevent = event.getUploadevent();	//1)이벤트 내용 업로드
		
		MultipartFile uploadthumb = event.getUploadthumb();	//2)이벤트 썸네일 업로드
		
		
		if(!uploadevent.isEmpty() && !uploadthumb.isEmpty()) {
			
			//1)이벤트 내용 업로드
			String contentfileName = uploadevent.getOriginalFilename();	//이벤트 내용 원래 파일명
			event.setEVENTCONTENT_ORIGINAL(contentfileName);	//이벤트 내용 원래 파일명 저장
			
			String contentfileDBName = fileDBname(contentfileName, saveFolder);
			logger.info("contentfileDBName(내용) = " + contentfileDBName);
			uploadevent.transferTo(new File(saveFolder + contentfileDBName));
			logger.info("transferTo path(내용) = " + saveFolder +  contentfileDBName);
			event.setEVENT_CONTENT(contentfileDBName);
			
			//2)이벤트 썸네일 업로드
			String thumbfileName = uploadthumb.getOriginalFilename();
			event.setEVENTFILE_ORIGINAL(thumbfileName);
			
			String thumbfileDBName = thumbfileDBname(thumbfileName, saveFolder);
			uploadthumb.transferTo(new File(saveFolder + thumbfileDBName));
			event.setEVENT_FILE(thumbfileDBName);
			
		}
		
		eventservice.insert_event(event);
		model.addAttribute("eventdata", event);
		
		return "redirect:/admin/manageEvent";
	}
	
	//이벤트 썸네일 파일 이름
	private String thumbfileDBname(String thumbfileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);	
		int month = c.get(Calendar.MONTH) + 1;	
		int date = c.get(Calendar.DATE);
		
		String homedir = saveFolder + "/event/thumb/" + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if(!(path1.exists())) {
			path1.mkdir();	//새로운 폴더 생성
		}
		
		//난수 구하기
		Random r = new Random();
		int random = r.nextInt(1000000000);
		
		/*** 확장자 구하기 시작 ***/
		int index = thumbfileName.lastIndexOf(".");
		//문자열에서 특정 문자열의 위치 값(index)을 반환합니다.
		logger.info("index = " + index);
		
		String fileExtension = thumbfileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);
		/*** 확장자 구하기 끝 ***/
		
		//새로운 파일명
		String refileName = "event" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);
		
		//오라클 디비에 저장될 파일명
		String thumbfileDBName = File.separator + "event"+  File.separator + "thumb" + File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		logger.info("fileDBName = " + thumbfileDBName);
		return thumbfileDBName;
	}
	
	
	//이벤트 내용 파일 이름
	private String fileDBname(String contentfileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);	
		int month = c.get(Calendar.MONTH) + 1;	
		int date = c.get(Calendar.DATE);
		
		String homedir = saveFolder + "/event/contents/" + year + "-" + month + "-" + date;
		logger.info(homedir);
		File path1 = new File(homedir);
		if(!(path1.exists())) {
			path1.mkdir();	//새로운 폴더 생성
		}
		
		//난수 구하기
		Random r = new Random();
		int random = r.nextInt(1000000000);
				
		/*** 확장자 구하기 시작 ***/
		int index = contentfileName.lastIndexOf(".");
		//문자열에서 특정 문자열의 위치 값(index)을 반환합니다.
		logger.info("index = " + index);
				
		String fileExtension = contentfileName.substring(index + 1);
		logger.info("fileExtension = " + fileExtension);
		/*** 확장자 구하기 끝 ***/
				
		//새로운 파일명
		String refileName = "event" + year + month + date + random + "." + fileExtension;
		logger.info("refileName = " + refileName);
				
		//오라클 디비에 저장될 파일명
		String fileDBName = File.separator + "event" +  File.separator + "contents" + File.separator + year + "-" + month + "-" + date + File.separator + refileName;
		logger.info("fileDBName = " + fileDBName);
		return fileDBName;
	}
	

	//관리자 - 이벤트 리스트 페이지
	@GetMapping("/admin/manageEvent")
	public ModelAndView eventList(ModelAndView mv, @RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		
		int limit = 10;	//한 화면에 출력할 로우 갯수
		int listcount = eventservice.getEventListCount();	//총 리스트 수

		//총 페이지 수
		int maxpage = (listcount + limit - 1) / limit;
		
		//현재 페이지에 보여줄 시작 페이지 수
		int startpage = ((page - 1)/10) * 10 + 1;
		
		//현재 페이지에 보여줄 마지막 페이지 수
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		List<Event> eventlist = eventservice.getEventList(page, limit);
		mv.setViewName("admin/manageEvent");
		mv.addObject("page", page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);		
		mv.addObject("endpage",endpage);
		mv.addObject("listcount",listcount);
		mv.addObject("eventlist",eventlist);
		mv.addObject("limit",limit);
		
		return mv;
	}
	
	
	//이벤트 내용 상세페이지(뷰 페이지)
		@GetMapping("/event/eventview")
		public String eventview() {
			return "event/event_viewform";
		}
	
	
	//이벤트 뷰 페이지 detail 주소
	@GetMapping("/event/detail")
	public ModelAndView viewDetail(ModelAndView mv, 
			HttpServletRequest request,
			@RequestHeader(value="EVENT_NUM", required=false) int eventNo) {
		
		logger.info("EVENT_NUM : " + eventNo);
		
		Event event = eventservice.getDetailEvent(eventNo);
		
//		if(event == null) {
//			logger.info("상세보기 실패");
//			mv.setViewName("error/error");
//			mv.addObject("url", request.getRequestURL());
//			mv.addObject("message", "상세보기 실패입니다.");
//		} else {
//			logger.info("상세보기 성공");
//			mv.setViewName("event/event_viewform");
//			mv.addObject("eventdata", event);
//		}
		
		mv.addObject("eventDetail", event);
		mv.setViewName("event/event_viewform");
		return mv;
	}

}
