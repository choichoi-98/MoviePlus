package com.hta.movieplus.mybatis.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.ChatRoomVO;
import com.hta.movieplus.domain.Member;

/*
	Mapper 인터페이스란 매퍼 파일에 기재된 SQL을 호출하기 위한 인터페이스입니다.
	MyBatis-Spring은 Mapper 인터페이스를 이용해서 실제 SQL 처리가 되는 클래스를 자동으로 생성합니다.
*/
@Mapper
public interface ChatMapper {
	
	//매니저, 관리자 목록 불러오기
	List<Member> getManagerList(String memberId);
	
	//db에 채팅방 존재 확인
	List<ChatRoomVO> checkChatRoom(String subjectId, String objectId);
	
	//채팅방 생성
	Object createChatRoom(String subjectId, String objectId);


	
}
