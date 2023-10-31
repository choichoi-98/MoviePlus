package com.hta.movieplus.service;

import java.util.List;
import java.util.Map;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.NoticeVO;

public interface NoticeService {

	public void noticeWrite(NoticeVO notice);
	
	public List<NoticeVO> getNoticelist(String string);
	
	public void deleteNoticeVO(int noticenum);

	public NoticeVO getNoticeModify(int getmodify);
	
	public void noticeModify(NoticeVO modify); //진행
	
	public List<NoticeVO> getNoticelistExceptEntire();

	public List<NoticeVO> getTotalNoticeList();

	public NoticeVO getNoticeDetail();
	
	public Map<String, Object> pagination(int page);
	
	public int getCountByNotice();

	public List<NoticeVO> getNoticelistPagination(int page, int i);

	public NoticeVO getNoticeDetail(int noticedetailnum);

	public Map<String, Object> theaterpagination(String theaterId, int page);

	public List<NoticeVO> getTheaterNoticeListPagination(int page, String theaterId, int i);

	public int getTheaterNoticeList(String theaterId);

	

	
}
