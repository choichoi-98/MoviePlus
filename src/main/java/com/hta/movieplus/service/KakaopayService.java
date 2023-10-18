package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.KakaoPayVO;

public interface KakaopayService {

	public void payInsert(int sid, int totalAmount, int seatCnt);

	public void insertPgToken(String pg_token);

	public List<KakaoPayVO> getAprBooking();


}
