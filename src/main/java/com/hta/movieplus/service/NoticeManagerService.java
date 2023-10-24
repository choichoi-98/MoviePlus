package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.NoticeVO;

public interface NoticeManagerService {

	public List<NoticeVO> getNoticeList(String theaterId);

	public int insertNotice(String managernotice);

}