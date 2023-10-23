package com.hta.movieplus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.ChatRoomVO;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {
   
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);


	List<ChatRoomVO> roomList = new ArrayList<ChatRoomVO>();
	static int roomNumber = 0;
	
	@RequestMapping("/chating")
	public ModelAndView chatting(ModelAndView mv) {
		
		mv.setViewName("chat/chat");
		logger.info("ChatController");
		return mv;
	}
	
	// 방 페이지
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/room");
		return mv;
	}
	
	//방 생성
	@RequestMapping("/createRoom")
	@ResponseBody
	public List<ChatRoomVO> createRoom(@RequestParam HashMap<Object, Object> params){
		String roomName = (String) params.get("roomName");
		if(roomName != null && !roomName.trim().equals("")) {
			ChatRoomVO room = new ChatRoomVO();
			room.setRoomNumber(++roomNumber);
			room.setRoomName(roomName);
			roomList.add(room);
		}
		return roomList;
	}
	
	//방 정보 가져오기
	@RequestMapping("/getRoom")
	@ResponseBody
	public List<ChatRoomVO> getRoom(@RequestParam HashMap<Object, Object> params){
		return roomList;
	}
	
	//채팅방
	@RequestMapping("/movieChating")
	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv = new ModelAndView();
		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
		
		List<ChatRoomVO> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNumber", params.get("roomNumber"));
			mv.setViewName("chat/chat");
		}else {
			mv.setViewName("chat/room");
		}
		return mv;
	}
	
}

