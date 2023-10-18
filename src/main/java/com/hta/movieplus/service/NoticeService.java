package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.NoticeVO;

public interface NoticeService {

	public void insertNoticeVO(NoticeVO notice);

	public List<NoticeVO> getNoticelist(String string);
		
	public void deleteNoticeVO(int noticenum);
	
	public List<NoticeVO> getNoticeModifyList(String string2);
}
