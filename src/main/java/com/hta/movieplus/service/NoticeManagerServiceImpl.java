package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.mybatis.mapper.NoticeManagerMapper;

@Service
public class NoticeManagerServiceImpl implements NoticeManagerService {

	NoticeManagerMapper dao;
	
	@Autowired
	public NoticeManagerServiceImpl(NoticeManagerMapper dao) {
		this.dao = dao;
	}
	
	
	@Override
	public List<NoticeVO> getNoticeList(String theaterId) {
		return dao.getManagerNoticeList(theaterId);
	}


	@Override
	public int insertNotice(String managernotice) {
		return dao.insertNotice(managernotice);
	}


}
