package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.BookingInfoDTO;
import com.hta.movieplus.domain.KakaoPayVO;

/*
	Mapper 인터페이스란 매퍼 파일에 기재된 SQL을 호출하기 위한 인터페이스입니다.
	MyBatis-Spring은 Mapper 인터페이스를 이용해서 실제 SQL 처리가 되는 클래스를 자동으로 생성합니다.
*/
@Mapper
public interface KakaopayMapper {
	
	public void payInsert(int scheduleId, int totalPrice, String KAPY_OCCUPIED_SEAT, int seatCnt, String MEMBER_ID);

	public void insertPgToken(String pg_token);

	public List<KakaoPayVO> getAprBooking();

	public List<BookingInfoDTO> getAprBookings();
	
}
