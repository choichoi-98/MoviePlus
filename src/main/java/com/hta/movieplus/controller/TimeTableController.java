package com.hta.movieplus.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.constant.TheaterLocationEnum;
import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.MovieDibsVO;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.domain.TheaterSchedule;
import com.hta.movieplus.domain.TimeTableDate;
import com.hta.movieplus.service.MovieService;
import com.hta.movieplus.service.SchedulingService;
import com.hta.movieplus.service.TheaterService;

@Controller
public class TimeTableController {

	SchedulingService schedulingService;
	TheaterService theaterService;
	
	private static final Logger logger = LoggerFactory.getLogger(TimeTableController.class);
	
	public TimeTableController(SchedulingService schedulingService, TheaterService theaterService) {
		// TODO Auto-generated constructor stub
		this.schedulingService = schedulingService;
		this.theaterService = theaterService;
	}
	
	@GetMapping("booking/timetable")
	public ModelAndView bookingTimetableView(ModelAndView mv) {
		List<Theater> theaterList = theaterService.getAllTheaterList();
		List<Movie> movieList = schedulingService.getOpenMovieList("");
		List<TimeTableDate> dateList = schedulingService.getDateList();
		
		mv.addObject("dateList", dateList);
		mv.addObject("theaterList", theaterList);
		mv.addObject("movieList", movieList);
		mv.addObject("locationList", TheaterLocationEnum.values());
		mv.setViewName("booking/booking_timetable");
		
		return mv;
	}
	
	@ResponseBody
	@PostMapping("booking/getMovieScheduleWithMovie")
	public Map<String, Object> getMovieScheduleWithMovie(String movieCode, String date, String location){
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("movieCode", movieCode);
		dataMap.put("date", date);
		dataMap.put("location", location);
		
		List<TheaterSchedule> scheduleList = schedulingService.getMovieScheduleWithMovie(dataMap);
		List<Theater> theaterList = schedulingService.getTheaterWithMovie(dataMap);
		List<TheaterRoom> theaterRoomList = schedulingService.getTheaterRoomWithMovie(dataMap);
		Movie movie = schedulingService.getMovieDetailByCode(movieCode);
		
		Map<String, Object> resultData = new HashMap<>();
		resultData.put("theaterList", theaterList);
		resultData.put("theaterRoomList", theaterRoomList);
		resultData.put("scheduleList", scheduleList);
		resultData.put("selected_movie", movie);
		
		
		return resultData;
	}
	
	@ResponseBody
	@PostMapping("booking/getMovieScheduleWithTheater")
	public Map<String, Object> getMovieScheduleWithTheater(String date, int theaterId){
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("date", date);
		dataMap.put("theaterId", theaterId);
		
		List<Movie> movieList = schedulingService.getMovieWithTheater(dataMap);
		List<TheaterRoom> theaterRoomList = schedulingService.getTheaterRoomWithTheater(dataMap);
		List<TheaterSchedule> scheduleList = schedulingService.getScheduleWithTheater(dataMap);
		
		
		Map<String, Object> resultData = new HashMap<>();
		
		resultData.put("movieList", movieList);
		resultData.put("theaterRoomList", theaterRoomList);
		resultData.put("scheduleList", scheduleList);
		
		return resultData;
	}
	
	
	@ResponseBody
	@PostMapping("booking/getTheaterRoomListWithScheduleCnt")
	public List<TheaterSchedule> getTheaterRoomListWithScheduleCnt(String movieCode, String date){
		List<TheaterSchedule> scheduleList = schedulingService.getTheaterRoomWithScheduleCnt(movieCode, date);
		
		return scheduleList;
	}
	
	@ResponseBody
	@PostMapping("booking/getScheduleListByDateAndMovieCodeAndTheaterId")
	public List<TheaterSchedule> getScheduleListByDateAndMovieCodeAndTheaterId(String movieCode, String date, String theaterId){
		List<TheaterSchedule> scheduleList = schedulingService.getScheduleListByDateAndMovieCodeAndTheaterId(movieCode, date, theaterId);
		
		return scheduleList; 
	}
	
	@ResponseBody
	@PostMapping("booking/getOpenMovieListWithScheduleCnt")
	public List<Movie> getOpenMovieListWithScheduleCnt(String date){
		List<Movie> movieList = schedulingService.getOpenMovieListWithScheduleCnt(date);
		
		return movieList;
	}
	
	@ResponseBody
	@PostMapping("booking/getScheduleListByTheaterIdAndDate_ajax")
	public List<TheaterSchedule> getScheduleListByTheaterIdAndDate_ajax(String date, String theaterId){
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("date", date);
		dataMap.put("theaterId", theaterId);
		
		List<TheaterSchedule> scheduleList = schedulingService.getScheduleWithTheater(dataMap);
		
		return scheduleList;
	}

	@ResponseBody
	@PostMapping("booking/getMovieDIBS")
	public List<MovieDibsVO> getMovieDIBS(Principal principal){
		List<MovieDibsVO> list = schedulingService.getMovieDibsList(principal.getName());
		
		return list; 
	}

		
}
