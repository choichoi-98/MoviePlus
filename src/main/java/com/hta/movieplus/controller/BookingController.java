package com.hta.movieplus.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.constant.TheaterLocationEnum;
import com.hta.movieplus.domain.FavoriteTheater;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.domain.TimeTableDate;
import com.hta.movieplus.service.SchedulingService;
import com.hta.movieplus.service.SeatService;
import com.hta.movieplus.service.TheaterManagerService;
import com.hta.movieplus.service.TheaterService;

@Controller
@RequestMapping(value = "/booking")
public class BookingController {
	
	SchedulingService schedulingService;
	TheaterService theaterService;
	TheaterManagerService theaterManagerService;
	SeatService seatService;
	
	
	@Autowired
	public BookingController(SchedulingService schedulingService, TheaterService theaterService, TheaterManagerService theaterManagerService, SeatService seatService) {
		// TODO Auto-generated constructor stub
		this.schedulingService = schedulingService;
		this.theaterService = theaterService;
		this.theaterManagerService = theaterManagerService;
		this.seatService = seatService;
	}
	
	@GetMapping("")
	public ModelAndView bookingMainView(ModelAndView mv, Principal principal) {
		List<Theater> theaterList = theaterService.getAllTheaterList();
		
		if(principal != null) {
			List<FavoriteTheater> favTheaterList = theaterService.getFavoriteTheaterListById(principal.getName());
			int favTheaterCnt = theaterService.getCountFavoriteTheater(principal.getName());
			mv.addObject("favTheaterList", favTheaterList);
			mv.addObject("favTheaterCnt", favTheaterCnt);
		}
		
		List<TimeTableDate> dateList = schedulingService.getDateList();
		
		
		mv.addObject("dateList", dateList);
		mv.addObject("theaterList", theaterList);
		mv.addObject("locationList", TheaterLocationEnum.values());
		mv.setViewName("booking/booking_main");
		
		return mv;
	}
	
	@GetMapping("/seat")
	public ModelAndView bookingSeatView(int scheduleId, ModelAndView mv) {
		TheaterSchedule schedule = schedulingService.getSchedule(scheduleId);
		Movie movie = schedulingService.getMovieDetailByCode(schedule.getMOVIE_CODE());
		TheaterRoom room = theaterManagerService.getTheaterRoomById(schedule.getTHEATER_ROOM_ID());
		String seat = seatService.makeSeatStr(room.getTHEATER_ROOM_SEAT());
		
		mv.addObject("seat", seat);
		mv.addObject("movie", movie);
		mv.addObject("schedule", schedule);
		mv.setViewName("booking/booking_seat");
		
		return mv;
	}
	
	@GetMapping("/cart")
	public ModelAndView bookingCartView(int scheduleId, int price, String[] seat, ModelAndView mv) {
		

		mv.setViewName("booking/booking_cart");
		
		return mv;
	}


}
