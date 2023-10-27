package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.ChatRoomVO;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.mybatis.mapper.ChatMapper;

@Service
public class ChatServiceImpl implements ChatService{
	
	private ChatMapper dao;
	
	@Autowired
	public ChatServiceImpl(ChatMapper dao) {
		this.dao = dao;
	}
	
	//매니저, 관리자 목록 불러오기
	public List<Member> getManagerList(String memberId) {
		return dao.getManagerList(memberId);
	}
	
	//db에 채팅방 존재 확인 
	public List<ChatRoomVO> checkChatRoom(String subjectId, String objectId) {
		return dao.checkChatRoom(subjectId, objectId);
	}
	
	//채팅방 생성
	public void createChatRoom(String subjectId, String objectId) {
		dao.createChatRoom(subjectId,objectId );
	}
	
	//1:1 채팅방 이름 설정
	public String findObjectName(String objectId) {
		return dao.findObjectName(objectId);
	}
	
	//char_room 관련한 정보 가져오기
	public List<ChatRoomVO> selectChatRoom(String roomN) {
		return dao.selectChatRoom(roomN);
		
	}
	
	//채팅 메시지 저장
	public int saveMessage(String chatFrom,  String content, String roomN) {
		return dao.saveMessage(chatFrom, content, roomN);
	}
	
}
