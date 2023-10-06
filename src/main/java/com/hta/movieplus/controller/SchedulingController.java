package com.hta.movieplus.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.Theater;
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
		
		String todayDate = schedulingService.getTodayDate();
		
		List<TheaterRoom> roomList = managerService.getRoomList(theaterId);
		Theater theater = theaterService.getTheaterById(theaterId);
		
		mv.addObject("todayDate", todayDate);
		mv.addObject("theater", theater);
		mv.addObject("roomList", roomList);
		mv.setViewName("manager/scheduling");
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/manager/getScheduleList")
	public List<TheaterSchedule> getScheduleList(@ModelAttribute("theaterId") int theaterId, SessionStatus sessionStatus,
			@RequestParam(value="todayDate", required=true) String todayDate
			){
		
		List<TheaterSchedule> scheduleList = schedulingService.getScheduleList(theaterId, todayDate);
		
		return scheduleList;
	}
	
	@ResponseBody
	@PostMapping("/manager/getOpenMovieList")
	public List<Movie> getOpenMovieList(@RequestParam(value="keyword", required=true) String keyword){
		
		List<Movie> movieList = schedulingService.getOpenMovieList(keyword); 
		
		
		return movieList;
	}
	
	@ResponseBody
	@PostMapping("/manager/addSchedule")
	public int addSchedule(TheaterSchedule schedule) {
		return schedulingService.addSchedule(schedule);
	}

}
