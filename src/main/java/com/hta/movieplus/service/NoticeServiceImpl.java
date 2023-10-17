



package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.mybatis.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	NoticeMapper dao; //매퍼와 연결
	
	@Autowired
	public NoticeServiceImpl(NoticeMapper dao) {
		this.dao= dao;
		/* 생성된 객체를 받아와야함 주입 주소를 받아온게 없음*/
	}
	
	@Override
	public void insertNoticeVO(NoticeVO notice) {
		dao.insertNoticeVO(notice);
	}

	@Override
	public List<NoticeVO> getNoticelist(String string) {
		// TODO Auto-generated method stub
		return dao.getNoticelist(string);
	}

	@Override
	public void deleteNoticeVO(int noticenum) {
		dao.deleteNoticeVO(noticenum);
	}

}
