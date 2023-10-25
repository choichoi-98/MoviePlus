package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.mybatis.mapper.NoticeManagerMapper;
import com.hta.movieplus.mybatis.mapper.TheaterMapper;

@Service
public class NoticeManagerServiceImpl implements NoticeManagerService {

	NoticeManagerMapper dao;
	TheaterMapper dao_theater;
	
	@Autowired
	public NoticeManagerServiceImpl(NoticeManagerMapper dao, TheaterMapper dao_theater) {
		this.dao = dao;
		this.dao_theater = dao_theater;
	}
	
	
	@Override
	public List<NoticeVO> getNoticeList(String theaterId) {
		return dao.getManagerNoticeList(theaterId);
	}


	@Override
	public int insertNotice(NoticeVO managernotice) {
		Theater theater = dao_theater.getTheaterById(Integer.parseInt(managernotice.getCUSTOMER_NOTICE_TYPE()));
		managernotice.setCUSTOMER_NOTICE_REGION(theater.getTHEATER_LOCATION());
		managernotice.setCUSTOMER_NOTICE_THEATER(theater.getTHEATER_NAME());
		
		return dao.insertNotice(managernotice);
	}


}
