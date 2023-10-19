package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.KakaoPayVO;

public interface KakaopayService {

	public void payInsert(int sid, int totalAmount, String KAPY_OCCUPIED_SEAT, int seatCnt, String MEMBER_ID);

	public void insertPgToken(String pg_token);

	public List<KakaoPayVO> getAprBooking();


}
