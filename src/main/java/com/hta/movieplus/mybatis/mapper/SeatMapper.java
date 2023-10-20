package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.KakaoPayVO;

@Mapper
public interface SeatMapper {

	List<KakaoPayVO> getBookedSeatList(int scheduleId);
	
	

}
