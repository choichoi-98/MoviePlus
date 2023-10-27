package com.hta.movieplus.controller;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.CustomerOneOnOneVO;
import com.hta.movieplus.domain.MailVO;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.domain.Total;
import com.hta.movieplus.service.CustomerService;
import com.hta.movieplus.service.ManagerTotalService;
import com.hta.movieplus.service.NoticeManagerService;
import com.hta.movieplus.service.NoticeService;
import com.hta.movieplus.service.SeatService;
import com.hta.movieplus.service.TheaterManagerService;
import com.hta.movieplus.service.TheaterService;
import com.hta.movieplus.task.SendMail;

@Controller
@RequestMapping(value = "/manager")
@SessionAttributes({ "theaterId", "theaterName" })
public class ManagerController {

	TheaterManagerService theaterManagerService;
	TheaterService theaterService;
	SeatService seatService;
	NoticeManagerService noticemanagerservice;
	NoticeService noticeService;
	ManagerTotalService totalService;
	CustomerService customerservice;
	private SendMail sendMail;
	private MailVO mailVO;

	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);

	@Autowired
	public ManagerController(TheaterManagerService theaterManagerService, TheaterService theaterService,
			SeatService seatService, NoticeManagerService noticemanagerservice, NoticeService noticeService,
			ManagerTotalService totalService, CustomerService customerservice, SendMail sendMail, MailVO mailVO) {
		// TODO Auto-generated constructor stub
		this.theaterManagerService = theaterManagerService;
		this.theaterService = theaterService;
		this.seatService = seatService;
		this.noticemanagerservice = noticemanagerservice;
		this.noticeService = noticeService;
		this.totalService = totalService;
		this.customerservice = customerservice;
		this.sendMail = sendMail;
		this.mailVO = mailVO;
	}

	@GetMapping("")
	public ModelAndView theaterMainView(ModelAndView mv, Principal principal, Model model,
			@RequestParam(value = "selectedId", required = false) String selectedId) {
		int theaterId = -1;

		String managerId = principal.getName();

		if (selectedId != null) {
			managerId = selectedId;
		}
		if (!managerId.equals("admin")) {
			theaterId = theaterManagerService.getTheaterIdByManagerId(managerId);
			model.addAttribute("theaterId", theaterId);
			model.addAttribute("theaterName", theaterService.getTheaterById(theaterId).getTHEATER_NAME());
		} // 대쉬보드 재 입장 오류

		/// 통계
		LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String currentdate = currentdatetime.format(format);
		String yesterday = currentdatetime.minusDays(1).format(format);

		logger.info(currentdate + "/" + theaterId);
		List<Total> totallist = totalService.dayReserveRate(theaterId, currentdate); // 일일 예매율
		List<Total> monthReserveRate = totalService.monthReserveRate(theaterId, currentdate); 	//이번달 예매율
		int dayTicketSales = totalService.dayTicketSales(theaterId, currentdate); // 일일 티켓 수익
		int yesterdayTicketSales = totalService.dayTicketSales(theaterId, yesterday); // 어제 티켓 수익
		int daySeatCount = totalService.daySeatCount(theaterId, currentdate); // 일일 관객수
		int yesterdaySeatCount = totalService.daySeatCount(theaterId, yesterday); // 어제 관객수
		List<Total> dayMovieseatCount = totalService.dayMovieseatCount(theaterId, currentdate); // 영화별 누적 관객수
		List<Total> daySeatRate = totalService.daySeatRate(theaterId, currentdate);

		mv.addObject("totallist", totallist);
		mv.addObject("dayTicketSales", dayTicketSales);
		mv.addObject("daySeatCount", daySeatCount);
		mv.addObject("yesterdayTicketSales", yesterdayTicketSales);
		mv.addObject("yesterdaySeatCount", yesterdaySeatCount);
		mv.addObject("dayMovieseatCount", dayMovieseatCount);
		mv.addObject("monthReserveRate", monthReserveRate);
		mv.addObject("daySeatRate", daySeatRate);
		/// 통계

		mv.setViewName("manager/main");
		return mv;
	}
	
	@GetMapping("/total")
	public String totallist(Model model) {
		int theaterId = (int) model.asMap().get("theaterId");

		LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String currentdate = currentdatetime.format(format);
		
		List<Total> totallist = totalService.dayReserveRate(theaterId, currentdate); // 일일 예매율
		model.addAttribute("totallist", totallist);
		
		return "manager/managerDaySeatRate";
		
	}
	
	@GetMapping("/seatrate")
	public String seatRate(Model model) {
		int theaterId = (int) model.asMap().get("theaterId");

		LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String currentdate = currentdatetime.format(format);
		
		List<Total> daySeatList = totalService.daySeatRate(theaterId, currentdate); // 일일 예매율
		model.addAttribute("daySeatList", daySeatList);
		
		return "manager/managerDaySeatRate";
		
	}
	
	@GetMapping("/totalcount")
	public String dayMovieseatCount(Model model) {
		int theaterId = (int) model.asMap().get("theaterId");
		LocalDateTime currentdatetime = LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String currentdate = currentdatetime.format(format);
		
		List<Total> dayMovieseatCount = totalService.dayMovieseatCount(theaterId, currentdate); 
		model.addAttribute("dayMovieseatCount", dayMovieseatCount);
		
		return "/manager/managerDayMovieseatCount";
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

	// ---------------------------------------------------------------------------------//
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
	// 리스트불러오기 oneonone
	@GetMapping("/oneononelist")
	public String goAnserList(@AuthenticationPrincipal Member member, Model model) {
		List<CustomerOneOnOneVO> list = customerservice.getMyInjury(member.getMEMBER_NUM());
		model.addAttribute("List", list);
		return "manager/managerAnswerList";
	}
	
	@GetMapping("/oneononeanswer")
	public String goAnserWrite(int CUSTOMER_NUM, Model model) {
		CustomerOneOnOneVO vo = customerservice.goAnserWrite(CUSTOMER_NUM);
		model.addAttribute("VO", vo);
		return "manager/managerAnswer";
	}
	@PostMapping("/managersendanswer")
	public String managerSendAnswer(CustomerOneOnOneVO VO) {
		mailVO.setContent(VO.getCUSTOMER_CONTENT());
		mailVO.setTo(VO.getCUSTOMER_EMAIL());
		sendMail.sendAnswer(mailVO);
		return "redirect:/manager/oneononelist";
	}
}