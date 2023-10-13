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
import com.hta.movieplus.service.SchedulingService;
import com.hta.movieplus.service.TheaterService;

@Controller
@RequestMapping(value = "/booking")
public class BookingController {
	
	SchedulingService schedulingService;
	TheaterService theaterService;
	
	
	@Autowired
	public BookingController(SchedulingService schedulingService, TheaterService theaterService) {
		// TODO Auto-generated constructor stub
		this.schedulingService = schedulingService;
		this.theaterService = theaterService;
	}
	
	@GetMapping("")
	public ModelAndView bookingMainView(ModelAndView mv, Principal principal) {
		List<Movie> movieList = schedulingService.getOpenMovieListWithScheduleCnt();
		List<Theater> theaterList = theaterService.getAllTheaterList();
		List<FavoriteTheater> favTheaterList = theaterService.getFavoriteTheaterListById(principal.getName());
		int favTheaterCnt = theaterService.getCountFavoriteTheater(principal.getName());
		
		mv.addObject("favTheaterCnt", favTheaterCnt);
		mv.addObject("favTheaterList", favTheaterList);
		mv.addObject("theaterList", theaterList);
		mv.addObject("movieList", movieList);
		mv.addObject("locationList", TheaterLocationEnum.values());
		mv.setViewName("booking/booking_main");
		
		return mv;
	}
	
	@GetMapping("/seat")
	public String bookingSeatView() {
		return "booking/booking_seat";
	}

}
