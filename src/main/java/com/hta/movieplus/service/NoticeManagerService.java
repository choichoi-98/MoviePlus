package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.CustomerOneOnOneVO;
import com.hta.movieplus.domain.NoticeVO;

public interface NoticeManagerService {

	public List<NoticeVO> getNoticeList(String theaterId);

	public int insertNotice(NoticeVO managernotice);
	
	public NoticeVO getManagerNoticeModify(int managernoticenum);
}
