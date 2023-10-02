package com.hta.movieplus.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.service.TheaterManagerService;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
	
	TheaterManagerService theaterManagerService;

	@Autowired
	public ManagerController(TheaterManagerService theaterManagerService) {
		// TODO Auto-generated constructor stub
		this.theaterManagerService = theaterManagerService;
	}
	//메뉴바 이동 부분만
	
	@GetMapping("/") 
	public String theaterMainView() {
		return "manager/main";
	}
	
	@GetMapping("/scheduling")
	public String theaterSchedulingView() {
		return "manager/scheduling";
	}

	@GetMapping("/manageroom")
	public ModelAndView manageRoomView(ModelAndView mv) {
		int roomCount = theaterManagerService.getRoomCountById();
		List<TheaterRoom> roomList = theaterManagerService.getRoomList();
		
		mv.addObject("roomCount", roomCount);
		mv.addObject("roomList", roomList);
		mv.setViewName("manager/manageRoom");
		return mv;
	}

	@GetMapping("/addroom")
	public ModelAndView addRoomView(ModelAndView mv) {
		String roomName = theaterManagerService.getRoomName();
		
		mv.addObject("roomName", roomName);
		mv.setViewName("manager/addRoom");
		
		return mv;
	}
	
	@PostMapping("/addRoomAction")
	public String addRoomAction(TheaterRoom theaterRoom) {
		theaterManagerService.addTheaterRoom(theaterRoom);
		
		return "redirect:/manager/manageroom";
	}

}
