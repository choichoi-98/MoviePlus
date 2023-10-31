package com.hta.movieplus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hta.movieplus.domain.ChatMessageVO;
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
	@ResponseBody
	public List<Member> friendList(@AuthenticationPrincipal Member member) {
	    List<Member> memberList = new ArrayList<>();
	    
	    if (member != null) {
	        String memberId = member.getMEMBER_ID();
	        logger.info("멤버 아이디 :" + memberId);
	        memberList = chatServiceImpl.getManagerList(memberId);
	    }

	    return memberList;
	}

	
	//chatRoom
	@RequestMapping("/chatRoom")
	@ResponseBody
	public Map<String, Object> chatRoom(@AuthenticationPrincipal Member member, @RequestParam("memberId") String objectId) {
	    Map<String, Object> response = new HashMap<>();

	    if (member != null) {
	        String subjectId = member.getMEMBER_ID();
	        logger.info("chat_from" + subjectId);
	        List<ChatRoomVO> check = chatServiceImpl.checkChatRoom(subjectId, objectId);
	        int checkSize = check.size();

	        if (checkSize != 0) {
	            logger.info("채팅방 존재");
	            response.put("chatRoomNum", check.get(0).getChat_Room_num());
	            logger.info("채팅방 번호" + check.get(0).getChat_Room_num());
	            response.put("chatSubject", check.get(0).getChat_Subject());
	            response.put("chatObject", check.get(0).getChat_Object());
	            response.put("userName", member.getMEMBER_NAME());
	        } else {
	            logger.info("채팅방 생성");
	            chatServiceImpl.createChatRoom(subjectId, objectId);
	            List<ChatRoomVO> chatRooms = chatServiceImpl.checkChatRoom(subjectId, objectId);
	            if (chatRooms != null && !chatRooms.isEmpty()) {
	                response.put("chatRoomNum", chatRooms.get(0).getChat_Room_num());
	                logger.info("채팅방 번호" + chatRooms.get(0).getChat_Room_num());
	                response.put("chatSubject", chatRooms.get(0).getChat_Subject());
	                response.put("chatObject", chatRooms.get(0).getChat_Object());
	                response.put("userName", member.getMEMBER_NAME());
	            }
	        }
	        response.put("chatFrom", subjectId);
	    }

	    return response;
	}

	
	//메시지 저장
	@ResponseBody
	@RequestMapping("/saveMessage")
	public String saveMessage(
			@RequestParam("chatFrom") String chatFrom,
			@RequestParam("content") String content,
			@RequestParam("roomNum") String roomN
			) {
		int result = chatServiceImpl.saveMessage(chatFrom,content,roomN);
		if(result == 1) {
			return "success";
		}else {
			
			return "fail";
		}
	}
	
	//메시지 list
	@ResponseBody
	@RequestMapping("/showMessage")
	public List<ChatMessageVO> showMessage(
			@RequestParam("roomNum") String roomN){
		
		List<ChatMessageVO> messageList = chatServiceImpl.getMessageList(roomN);
		for (ChatMessageVO message : messageList) {
		   logger.info(message.getMessage_from());
		   logger.info(message.getContent());
		   logger.info(message.getCreate_at() + "");
		   logger.info(message.getDate() + "");
		   logger.info("보낸 사람 이름 : " + message.getMember_name() );
        }
		
		return messageList;
		
	}
	
	//채팅 목록
	@RequestMapping("/chatList")
	public ModelAndView chatList(ModelAndView mv,
				@AuthenticationPrincipal Member member) {
		
		if(member != null) {
			String memberId = member.getMEMBER_ID();
			logger.info("freindList의 memberId = " + memberId);
			List<ChatRoomVO> chatList = chatServiceImpl.getChatRoomList(memberId);
			
			List<ChatRoomVO> filteredChatList = chatList.stream()
				    .filter(chat -> chat.getContent() != null)
				    .collect(Collectors.toList());

//				for (ChatRoomVO chatRoom : filteredChatList) {
//				    logger.info("ChatRoomID: " + chatRoom.getChat_Room_num());
//				    logger.info("MessageFrom: " + chatRoom.getMessage_from());
//				    logger.info("CreateAt: " + chatRoom.getDate());
//				    logger.info("Content: " + chatRoom.getContent());
//				}

			mv.addObject("chatList",filteredChatList);
		}

		mv.setViewName("chat/ChatCssTest");
		return mv;
	}
	

	//채팅 목록 ajax
	@RequestMapping("/chatListAjax")
	@ResponseBody
	public List<ChatRoomVO> chatListAjax(@AuthenticationPrincipal Member member) {
	    List<ChatRoomVO> chatList = new ArrayList<>();
	    logger.info("여기는 chatListAjax");
	    if (member != null) {
	        String memberId = member.getMEMBER_ID();
	        logger.info("friendList의 memberId = " + memberId);
	        chatList = chatServiceImpl.getChatRoomList(memberId);
	    }

	    List<ChatRoomVO> filteredChatList = chatList.stream()
	            .filter(chat -> chat.getContent() != null)
	            .collect(Collectors.toList());

	    return filteredChatList;
	}

	
	// 방 페이지
	@RequestMapping("/room")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chat/room");
		return mv;
	}
	

	
	//방 정보 가져오기
	@RequestMapping("/getRoom")
	@ResponseBody
	public List<ChatRoomVO> getRoom(@RequestParam HashMap<Object, Object> params){
		logger.info("=========컨트롤러: getRoom ============");
		return roomList;
	}
	

	
}

