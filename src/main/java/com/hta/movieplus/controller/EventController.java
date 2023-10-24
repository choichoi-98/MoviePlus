package com.hta.movieplus.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hta.movieplus.domain.Event;
import com.hta.movieplus.domain.EventApply;
import com.hta.movieplus.domain.Member;
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
	
	//이벤트 타입별 전체 리스트를 불러오는 메서드
	private void eventListAll(ModelAndView mv) {
		List<Event> movieEventList = eventservice.getMovieEventList();
		List<Event> theaterEventList = eventservice.getTheaterEventList();
		List<Event> promotionEventList = eventservice.getPromotionEventList();
		List<Event> curtaincallEventList = eventservice.getCurtaincallEventList();
		
		mv.addObject("movieEventList", movieEventList);
		mv.addObject("theaterEventList", theaterEventList);
		mv.addObject("promotionEventList", promotionEventList);
		mv.addObject("curtaincallEventList", curtaincallEventList);
	}
	
	
	//이벤트 테스트
	@GetMapping("/event/test")
	public String test() {
		
		return "event/event_viewform_copy";
	}
	
	//이벤트 전체 페이지(메인)
	@GetMapping("/event")
	public ModelAndView eventmain(ModelAndView mv) throws Exception {
		
		eventListAll(mv);
		mv.setViewName("event/event_main");
		
		return mv;
	}
	
	
	//지난 이벤트 페이지
	@GetMapping("/event/end")
	public ModelAndView endEvent(ModelAndView mv) {
		
		List<Event> eventlist = eventservice.getAllEventList();
		int eventListCountStatus = eventservice.getEventListCountStatus();
		
		mv.addObject("eventlist", eventlist);
		mv.addObject("eventlistcount", eventListCountStatus);
		mv.setViewName("event/event_end");

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
	public ModelAndView eventList(ModelAndView mv, 
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		
		int eventlistcount = eventservice.getEventListCount();	//총 리스트 수
		
		Map<String, Object> pagemap = eventservice.pagination(page);
		List<Event> eventlist = eventservice.getEventList(page, (int) pagemap.get("limit"));
		
		mv.setViewName("admin/manageEvent");
		
		mv.addAllObjects(pagemap);
		
		mv.addObject("eventlistcount",eventlistcount);
		mv.addObject("eventlist",eventlist);
		
		return mv;
	}
	
	
	//관리자 - 이벤트 수정
	@GetMapping("/admin/modifyEvent")
	public ModelAndView modifyEvent(@RequestParam(value = "num") int num, ModelAndView mv) {
		Event event = eventservice.getDetailEvent(num);
		mv.addObject("eventdata", event);
		mv.setViewName("admin/modifyEvent");
		return mv;
	}
	
	//관리자 - 이벤트 수정프로세스
	@PostMapping("/admin/modifyEventProcess")
	public String modifyEventProcess(Event event, String concheck, String thumbcheck,
							  HttpServletRequest request, RedirectAttributes rattr,
							  Model model) throws Exception {
		
		MultipartFile uploadevent = event.getUploadevent();	//1)이벤트 내용 업로드
		
		MultipartFile uploadthumb = event.getUploadthumb();	//2)이벤트 썸네일 업로드
		
		if(concheck != null && concheck.equals("")) {
			logger.info("기존파일 그대로 사용");
			event.setEVENTCONTENT_ORIGINAL(concheck);
			
		} else if(concheck != null && concheck.equals("")) {
			logger.info("기존파일 그대로 사용");
			event.setEVENTFILE_ORIGINAL(thumbcheck);
		}
		else {
			
			if(!uploadevent.isEmpty() && !uploadthumb.isEmpty()) {
				logger.info("파일 추가/변경");
				
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
			} else {
				logger.info("선택 파일이 없습니다.");
				event.setEVENT_FILE("");
				event.setEVENTFILE_ORIGINAL("");
				event.setEVENT_CONTENT("");
				event.setEVENTCONTENT_ORIGINAL("");
			}
		}
		
		int result = eventservice.updateEvent(event);
		
		if(result == 1) {
			model.addAttribute("eventdata", event);
		} else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "정보 수정 실패");
		}
		return "redirect:/admin/manageEvent";
 	}
	
	//관리자 - 이벤트 삭제
	@GetMapping("/admin/deleteEvent")
	public String deleteEvent(int num) {
		eventservice.deleteEvent(num);
		logger.info("이벤트num : " + num);
		return "redirect:/admin/manageEvent";
	}
	
	//관리자 - 이벤트 상태 변경
	@GetMapping("/admin/changeStatus")
	public String changeStatus(int num, String status)throws Exception {
		eventservice.changeStatus(num, status);
		return "redirect:/admin/manageEvent";
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
			@RequestParam(value="num", required=false) int num) {
		
		logger.info("EVENT_NUM : " + num);
		
		Event event = eventservice.getDetailEvent(num);
		
		mv.addObject("eventDetail", event);
		mv.setViewName("event/event_viewform");
		return mv;
	}

	//이벤트 당첨자발표 페이지
	@GetMapping("/event/winner")
	public ModelAndView eventWinner(ModelAndView mv, 
			@RequestParam(value = "page", defaultValue = "1", required = false) int page) {
		
		int eventlistcount = eventservice.getCurtaincallEventListEndCount();	//총 리스트 수
		
		Map<String, Object> pagemap = eventservice.pagination(page);
		List<Event> eventlist = eventservice.getEventListdesc(page, (int) pagemap.get("limit"));
		
		mv.addAllObjects(pagemap);
		mv.setViewName("event/event_winner");
		
		mv.addObject("eventlistcount",eventlistcount);
		mv.addObject("eventlist",eventlist);
		
		
		return mv;
	}
	
	//관리자 - 이벤트 당첨 발표내용 추가
	@GetMapping("/admin/eventResult")
	public ModelAndView eventResult(@RequestParam(value = "num") int num, ModelAndView mv) {
		Event event = eventservice.getDetailEvent(num);
		mv.addObject("eventdata", event);
		mv.setViewName("admin/addEventResult");
		return mv;
	}
	
	//관리자 - 이벤드 당첨 발표내용 추가 프로세스
	@PostMapping("/admin/eventResultProcess")
	public String eventResultProcess(Event event, Model model, HttpServletRequest request) {
		
		int result = eventservice.update_eventResult(event);
		
		if(result == 1) {
			model.addAttribute("eventresult", event);
		} else {
			model.addAttribute("url", request.getRequestURL());
			model.addAttribute("message", "정보 수정 실패");
		}
		return "redirect:/admin/manageEvent";
	}
	
	//이벤트 당첨 뷰 페이지 detail 주소
	@GetMapping("/event/winnerdetail")
	public ModelAndView resultviewDetail(ModelAndView mv, 
				HttpServletRequest request,
				@RequestParam(value="num", required=false) int num) throws Exception{
			
			logger.info("EVENT_NUM : " + num);
			
			Event event = eventservice.getDetailEvent(num);
			List<EventApply> eventapply = eventservice.getEventwinnerList(num);
			
			mv.addObject("eventlist", event);
			mv.addObject("eventwinner", eventapply);
			
			mv.setViewName("event/event_resultform");
			return mv;
	}
	
	//회원 - 이벤트 신청
	@PostMapping("/event/apply")
	public String eventApply(EventApply eventapply, Model model) {
		eventservice.insertEventApply(eventapply);
		model.addAttribute("eventapply", eventapply);
		
		return "redirect:/event";
	}
	
	//이벤트 신청 중복확인 ajax
	@ResponseBody
	@PostMapping("/event/applycheck")
	public int applycheck(@RequestParam("id") String MEMBER_ID, @RequestParam("eventNum") String EVENT_NUM) {
		return eventservice.applycheck(MEMBER_ID, EVENT_NUM);
	}
	
	
	//관리자 - 이벤트 당첨자 관리페이지 이동
	@GetMapping("/admin/updateWinner")
	public ModelAndView updateWinner(@RequestParam(value = "num") int num, ModelAndView mv) {
		List<EventApply> eventapply = eventservice.getEventapplyList(num);
		mv.addObject("eventapply", eventapply);
		mv.setViewName("admin/manageEventWinner");
		return mv;
	}
	
	//관리자 - 이벤트 당첨자 선택
	@ResponseBody
	@GetMapping("/admin/pickWinner")
	public String pickWinner(@RequestParam(value = "num") int num, 
						 ModelAndView mv) throws Exception {
		
		List<EventApply> eventapplylist = eventservice.getEventapplyList(num);
		logger.info("num 정보 = " + num);
		
		//이벤트 당첨 여부 업데이트할 랜덤 인덱스 목록
		List<Integer> randomIndexlist = new ArrayList<>();
		Random random = new Random();
		
		int winnercount = 2;
		
		//중복되지 않는 랜덤 인덱스 생성
		while(randomIndexlist.size() < winnercount && randomIndexlist.size() < eventapplylist.size()) {
			int randomindex; 
			
			do{
				randomindex = random.nextInt(eventapplylist.size());
			}
			while(randomIndexlist.contains(randomindex));
			
			randomIndexlist.add(randomindex);
		}
		
		String EVENT_DRAW = "Y";
		
		for(int randomindex : randomIndexlist) {
			EventApply eventApply = eventapplylist.get(randomindex);
	        eventservice.updateEventDraw(EVENT_DRAW, eventApply.getEVENT_APPLY_NUM());
		}
		
		
		return "redirect:/admin/manageEvent";
	}
	
	
	//마이페이지 - 나의 이벤트 응모내역
	@GetMapping("/member/myevent")
	public ModelAndView mypageEvent(@AuthenticationPrincipal Member member, 
									ModelAndView mv) throws Exception{
		String memberId = member.getMEMBER_ID();
		List<EventApply> myEventlist = eventservice.getmyEventlist(memberId);	
		
		mv.addObject("myEventlist", myEventlist);
		mv.setViewName("member/mypage_event");
		
		return mv;
	}
		
	
	
	
	
	
}
