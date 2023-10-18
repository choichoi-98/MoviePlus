package com.hta.movieplus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.mybatis.mapper.KakaopayMapper;

@Service
public class KakaopayServiceImpl implements KakaopayService {
	
	private KakaopayMapper dao;
	
	@Autowired
	public KakaopayServiceImpl(KakaopayMapper dao) {
		this.dao = dao;
	}

	@Override
	public void payInsert(int scheduleId, int totalPrice, int seatCnt) {
		dao.payInsert(scheduleId, totalPrice, seatCnt);
	}

}
