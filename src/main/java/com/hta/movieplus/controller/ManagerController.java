package com.hta.movieplus.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.service.TheaterManagerService;

@Controller
@RequestMapping(value = "/manager")
@SessionAttributes(value = "theaterId")
public class ManagerController {
	
	TheaterManagerService theaterManagerService;

	@Autowired
	public ManagerController(TheaterManagerService theaterManagerService) {
		// TODO Auto-generated constructor stub
		this.theaterManagerService = theaterManagerService;
	}
	
	@GetMapping("") 
	public ModelAndView theaterMainView(ModelAndView mv, Principal principal, Model model,
									@RequestParam(value="selectedId", required=false) String selectedId) {
		
		
		String managerId = principal.getName();

		if(selectedId != null) {
			managerId = selectedId;
		}
		if(!managerId.equals("admin")) {
			model.addAttribute("theaterId", theaterManagerService.getTheaterIdByManagerId(managerId));
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
		
		System.out.println(theaterRoom);
		
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

}
