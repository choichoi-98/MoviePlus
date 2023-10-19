package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.NoticeVO;

public interface NoticeService {

	public void noticeWrite(NoticeVO notice);
	
	public List<NoticeVO> getNoticelist(String string);
	
	public void deleteNoticeVO(int noticenum);

	public NoticeVO getNoticeModify(int getmodify);
	
	
	
	
	public void noticeModify(NoticeVO modify); //진행

	/* public void noticeModify(int modify); */
	
	
	
	

	
}
