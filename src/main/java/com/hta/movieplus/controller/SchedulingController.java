package com.hta.movieplus.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.service.SchedulingService;
import com.hta.movieplus.service.TheaterManagerService;
import com.hta.movieplus.service.TheaterService;

@Controller
@SessionAttributes(value = "theaterId")
public class SchedulingController {

	SchedulingService schedulingService;
	TheaterManagerService managerService;
	TheaterService theaterService;
	
	private static final Logger logger = LoggerFactory.getLogger(SchedulingController.class);

	@Autowired
	public SchedulingController(SchedulingService schedulingService, TheaterManagerService managerService, TheaterService theaterService) {
		// TODO Auto-generated constructor stub
		this.schedulingService = schedulingService;
		this.managerService = managerService;
		this.theaterService = theaterService;
	}
	
	@GetMapping("/manager/scheduling")
	public ModelAndView theaterSchedulingView(@ModelAttribute("theaterId") int theaterId, SessionStatus sessionStatus
												,ModelAndView mv) {
		List<TheaterRoom> roomList = managerService.getRoomList(theaterId);
		String theaterName = theaterService.getTheaterById(theaterId).getTHEATER_NAME();
		
		mv.addObject("theaterName", theaterName);
		mv.addObject("roomList", roomList);
		mv.setViewName("manager/scheduling");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/getScheduleList")
	public List<TheaterSchedule> getScheduleList(@ModelAttribute("theaterId") int theaterId, SessionStatus sessionStatus){
		
		List<TheaterSchedule> scheduleList = schedulingService.getScheduleList(theaterId);
		
		return scheduleList;
	}

}
