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
	
}
