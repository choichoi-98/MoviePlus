package com.hta.movieplus.service;

import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.mybatis.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	NoticeMapper dao; //매퍼와 연결
	
	@Override
	public void insertNoticeVO(NoticeVO notice) {
		dao.insertNoticeVO(notice);
	}
		
	
}
