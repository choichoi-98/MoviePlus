package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.BookingInfoDTO;
import com.hta.movieplus.domain.CouponVO;
import com.hta.movieplus.domain.KakaoPayVO;

public interface KakaopayService {

	public void payInsert(int sid, int totalAmount, String KPAY_OCCUPIED_SEAT, int seatCnt, String MEMBER_ID);

	public void insertPgToken(String pg_token, String today);

	public List<KakaoPayVO> getAprBooking();

	public List<BookingInfoDTO> getAprBookings();

	public CouponVO getCouponByCode(String COUPON_CODE);

	public void delPaidBook(int kPAY_NUM);


}
