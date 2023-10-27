package com.hta.movieplus.mybatis.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.ChatRoomVO;
import com.hta.movieplus.domain.Member;

@Mapper
public interface ChatMapper {
	
	//매니저, 관리자 목록 불러오기
	List<Member> getManagerList(String memberId);
	
	//db에 채팅방 존재 확인
	List<ChatRoomVO> checkChatRoom(String subjectId, String objectId);

	//채팅방 생성
	void createChatRoom(String subjectId, String objectId);
	
	//1:1 채팅방 이름 설정
	String findObjectName(String objectId);
	
	//채팅방 정보 가져오기
	List<ChatRoomVO> selectChatRoom(String roomN);
	
	
}
