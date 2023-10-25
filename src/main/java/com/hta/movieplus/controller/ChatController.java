package com.hta.movieplus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.ChatRoomVO;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.service.ChatServiceImpl;

@Controller
@RequestMapping(value = "/chat")
public class ChatController {

	@Autowired
	private ChatServiceImpl chatServiceImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);


	List<ChatRoomVO> roomList = new ArrayList<ChatRoomVO>();
	static int roomNumber = 0;
	
	@RequestMapping("/chat")
	public ModelAndView chat(ModelAndView mv) {
		mv.setViewName("chat/chat");
		return mv;
	}
	
	//친구 목록
	@RequestMapping("/friendList")
	public ModelAndView friendList(ModelAndView mv,
				@AuthenticationPrincipal Member member) {
		
		if(member != null) {
			String memberId = member.getMEMBER_ID();
			logger.info("freindList의 memberId = " + memberId);
			List<Member> memberList = chatServiceImpl.getManagerList(memberId);
			mv.addObject("memberList",memberList);
		}
		mv.setViewName("chat/friendList");
		return mv;
	}
	
	//chatRoom
	@RequestMapping("/chatRoom")//createRoom
	public ModelAndView chatRoom(ModelAndView mv,
				@AuthenticationPrincipal Member member,
				@RequestParam("obejctId") String objectId) {
		//0. 두 사람과 관련된 방이 있는지 확인
		if(member != null) {
			String subjectId = member.getMEMBER_ID();
			List<ChatRoomVO> check = chatServiceImpl.checkChatRoom(subjectId, objectId);
			int checkSize = check.size();
			
			if(checkSize != 0) {//채팅방이 존재하는 경우
				logger.info("채팅방 존재");
				mv.addObject("chatRoomNum", check.get(0).getChat_Room_num());
		        mv.addObject("chatSubject", check.get(0).getChat_Subject());
		        mv.addObject("chatObject", check.get(0).getChat_Object());
		        mv.addObject("userName", member.getMEMBER_NAME());
			}else {//채팅방이 존재하지 않는 경우-채팅방 생성
				logger.info("채팅방 생성");
				//채팅방 생성 
			    chatServiceImpl.createChatRoom(subjectId, objectId);
			    //생성한 채팅방 정보 다시 불러오기
			    List<ChatRoomVO> chatRooms = chatServiceImpl.checkChatRoom(subjectId, objectId);
			    if (chatRooms != null && !chatRooms.isEmpty()) {
			        // 채팅방 정보를 ModelAndView에 추가
			        mv.addObject("chatRoomNum", chatRooms.get(0).getChat_Room_num());
			        mv.addObject("chatSubject", chatRooms.get(0).getChat_Subject());
			        mv.addObject("chatObject", chatRooms.get(0).getChat_Object());
			        mv.addObject("userName", member.getMEMBER_NAME());
			    }
			}
		}
		mv.setViewName("chat/chatroom");
		return mv;
	}
	
	// 방 페이지
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/room");
		return mv;
	}
	
	//방 생성
//	@RequestMapping("/createRoom")
//	@ResponseBody
//	public List<ChatRoomVO> createRoom(@RequestParam HashMap<Object, Object> params){
//		
//		logger.info("=========컨트롤러: createRoom ============");
//		String roomName = (String) params.get("roomName");
//		logger.info("createRoom roomName = "+roomName);
//		if(roomName != null && !roomName.trim().equals("")) {
//			ChatRoomVO room = new ChatRoomVO();
//			room.setRoomNumber(++roomNumber);
//			room.setRoomName(roomName);
//			roomList.add(room);
//		}
//		
//		   for (ChatRoomVO room : roomList) {
//		        System.out.println("Room Number: " + room.getRoomNumber() + ", Room Name: " + room.getRoomName());
//		    }
//		
//		return roomList;
//	}
	
	//방 정보 가져오기
	@RequestMapping("/getRoom")
	@ResponseBody
	public List<ChatRoomVO> getRoom(@RequestParam HashMap<Object, Object> params){
		logger.info("=========컨트롤러: getRoom ============");
		return roomList;
	}
	
	//채팅방
//	@RequestMapping("/moveChating")
//	public ModelAndView chating(@RequestParam HashMap<Object, Object> params) {
//		ModelAndView mv = new ModelAndView();
//		String roomN = (String)params.get("roomNumber");
//		logger.info("moveChating roomN: " + roomN);
//		int roomNumber = Integer.parseInt((String) params.get("roomNumber"));
//		
////		List<ChatRoomVO> new_list 
////			= roomList.stream().filter(o->o.getRoomNumber()==roomNumber).collect(Collectors.toList());
//		List<ChatRoomVO> new_list = new ArrayList<>();
//		for (ChatRoomVO room : roomList) {
//		    if (room.getRoomNumber() == roomNumber) {
//		        new_list.add(room);
//		    }
//		}
//
//		if(new_list != null && new_list.size() > 0) {
//			logger.info("=========if문 안===========================");
//			mv.addObject("roomName", params.get("roomName"));
//			mv.addObject("roomNumber", params.get("roomNumber"));
//			mv.setViewName("chat/chat");
//		}else {
//			mv.setViewName("chat/room");
//		}
//		return mv;
//	}
	
}

