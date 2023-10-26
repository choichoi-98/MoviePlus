package com.hta.movieplus.controller;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.service.NoticeManagerService;
import com.hta.movieplus.service.NoticeService;
import com.hta.movieplus.service.SeatService;
import com.hta.movieplus.service.TheaterManagerService;
import com.hta.movieplus.service.TheaterService;

@Controller
@RequestMapping(value = "/manager")
@SessionAttributes({"theaterId", "theaterName"})
public class ManagerController {
	
	TheaterManagerService theaterManagerService;
	TheaterService theaterService;
	SeatService seatService;
	NoticeManagerService noticemanagerservice;
	NoticeService noticeService;
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);


	@Autowired
	public ManagerController(TheaterManagerService theaterManagerService, TheaterService theaterService, SeatService seatService, NoticeManagerService noticemanagerservice, NoticeService noticeService) {
		// TODO Auto-generated constructor stub
		this.theaterManagerService = theaterManagerService;
		this.theaterService = theaterService;
		this.seatService = seatService;
		this.noticemanagerservice = noticemanagerservice;
		this.noticeService = noticeService;
	}
	
	@GetMapping("") 
	public ModelAndView theaterMainView(ModelAndView mv, Principal principal, Model model,
									@RequestParam(value="selectedId", required=false) String selectedId) {
		
		
		String managerId = principal.getName();

		if(selectedId != null) {
			managerId = selectedId;
		}
		if(!managerId.equals("admin")) {
			int theaterId = theaterManagerService.getTheaterIdByManagerId(managerId);
			model.addAttribute("theaterId", theaterId);
			model.addAttribute("theaterName", theaterService.getTheaterById(theaterId).getTHEATER_NAME());
		} // 대쉬보드 재 입장 오류
		
		
		mv.setViewName("manager/main");
		return mv;
	}
	
	@GetMapping("/manageroom")
	public ModelAndView manageRoomView(ModelAndView mv, Model model) {
		int theaterId = (int) model.asMap().get("theaterId");
		int roomCount = theaterManagerService.getRoomCountById(theaterId);
		List<TheaterRoom> roomList = theaterManagerService.getRoomList(theaterId);
		
		mv.addObject("roomCount", roomCount);
		mv.addObject("roomList", roomList);
		mv.setViewName("manager/manageRoom");
		return mv;
	}

	@GetMapping("/addroom")
	public ModelAndView addRoomView(ModelAndView mv, Model model) {
		int theaterId = (int) model.asMap().get("theaterId");
		String roomName = theaterManagerService.getRoomName(theaterId);
		
		mv.addObject("roomName", roomName);
		mv.setViewName("manager/addRoom");
		
		return mv;
	}
	
	@PostMapping("/addRoomAction")
	public String addRoomAction(ModelAndView mv, TheaterRoom theaterRoom, Model model) {
		int theaterId = (int) model.asMap().get("theaterId");
		theaterRoom.setTHEATER_ID(theaterId);

		theaterRoom.setTHEATER_ROOM_SEAT_CNT(seatService.getSeatCount(theaterRoom.getTHEATER_ROOM_SEAT()));
		
		theaterManagerService.addTheaterRoom(theaterRoom);
		
		
		return "redirect:/manager/manageroom";
	}
	
	@GetMapping("/modifyRoom")
	public ModelAndView modifyRoomView(int room_id, ModelAndView mv) {
		TheaterRoom theaterRoom = theaterManagerService.getTheaterRoomById(room_id);
		
		mv.addObject("theaterRoom", theaterRoom);
		mv.setViewName("manager/modifyRoom");
		return mv;
	}
	
	@PostMapping("/modifyRoomAction")
	public String modfiyRoomAction(TheaterRoom theaterRoom) {
		
		theaterRoom.setTHEATER_ROOM_SEAT_CNT(seatService.getSeatCount(theaterRoom.getTHEATER_ROOM_SEAT()));
		theaterManagerService.modifyTheaterRoom(theaterRoom);
		
	
		
		return "redirect:/manager/manageroom";
	}
	
	@GetMapping("/deleteRoomAction")
	public String deleteRoomAction(int room_id) {
		theaterManagerService.deleteRoomById(room_id);
		return "redirect:/manager/manageroom";
	}
	
	@GetMapping("/changeStatusRoomAction")
	public String changeStatusRoomAction(int num, String status) {
		theaterManagerService.changeStatusRoomById(num, status);
		return "redirect:/manager/manageroom";
	}
	//---------------------------------------------------------------------------------//
	/* 극장별 공지사항 main 페이지 리스트로 이동 */
	@GetMapping("/noticelist")
	public String getNoticeList(Model model) {
		String theaterId = model.asMap().get("theaterId").toString();
		List<NoticeVO> noticelist = noticemanagerservice.getNoticeList(theaterId);
		model.addAttribute("NoticeList", noticelist);
		return "manager/managerNoticeList";
	}
	
	/* 극장별 공지사항작성 페이지 이동 */
	@GetMapping("/noticeregist")
	public String goNoticeWrite() {
		return "manager/managerNotice";
	}
	
	/* 공지사항 등록 버튼 클릭 -> 데이터 넘기기 */
	@PostMapping("/insertnotice")
	public String insertNotice(NoticeVO managernotice, Model model) {
		String theaterId = model.asMap().get("theaterId").toString();
		managernotice.setCUSTOMER_NOTICE_TYPE(theaterId);
		noticemanagerservice.insertNotice(managernotice);
		logger.info(managernotice.toString());
		return "redirect:/manager/noticelist";
	}
	// 공지사항 수정페이지로 이동하면서 데이터 가져옴
	@GetMapping("/gonoticemodify")
		public String goManagerNoticeModify(int managernoticenum, Model model) {
		NoticeVO managernotice = noticemanagerservice.getManagerNoticeModify(managernoticenum);
		model.addAttribute("ManagerNotice", managernotice);
		return "manager/managerNoticeModify";
	}
	
	@PostMapping("/noticemodify")
	public String noticeModify(NoticeVO modify) {
		noticeService.noticeModify(modify);
		return "redirect:/manager/noticelist";
	}
	
	@GetMapping("/noticedelete")
	public String noticedelete(int noticenum) {
		noticeService.deleteNoticeVO(noticenum);
		return "redirect:/manager/noticelist";
	}
}