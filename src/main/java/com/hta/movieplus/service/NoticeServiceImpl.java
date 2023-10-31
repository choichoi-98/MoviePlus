



package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<NoticeVO> getNoticelist(String string) {
		return dao.getNoticelist(string);
	}
	
	@Override
	public void noticeWrite(NoticeVO notice) {
		notice.setCUSTOMER_NOTICE_THEATER("무비플러스");
		notice.setCUSTOMER_NOTICE_REGION("무비플러스");
		dao.noticeWrite(notice);
	}
	

	@Override
	public void deleteNoticeVO(int noticenum) {
		dao.deleteNoticeVO(noticenum);
	}

	@Override
	public NoticeVO getNoticeModify(int getmodify) {
		return dao.getNoticeModify(getmodify);
	}
	
	@Override
	public void noticeModify(NoticeVO modify) {
		dao.noticeModify(modify);
	}

	@Override
	public List<NoticeVO> getNoticelistExceptEntire() {
		return dao.getNoticelistExceptEntire();
	}

	@Override
	public List<NoticeVO> getTotalNoticeList() {
		return dao.getTotalNoticeList();
	}

	@Override
	public NoticeVO getNoticeDetail() {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int getCountByNotice() {
		// TODO Auto-generated method stub
		return dao.getCountByNotice();
	}
	
	@Override
	public Map<String, Object> pagination(int page) {
		// TODO Auto-generated method stub
		Map<String, Object> paginationDataMap = new HashMap<String, Object>();

		int limit = 10; // 한 페이지에 보여줄 갯수

		int listcount = getCountByNotice(); // 공지사항의 개수

		int maxpage = (listcount + limit - 1) / limit; // 페이지의 갯수

		int startpage = ((page - 1) / 6) * 6 + 1; // 페이지 시작값

		int endpage = startpage + 6 - 1; // 페이지 마지막값

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		paginationDataMap.put("page", page);
		paginationDataMap.put("maxpage", maxpage);
		paginationDataMap.put("startpage", startpage);
		paginationDataMap.put("endpage", endpage);
		paginationDataMap.put("limit", limit);
		return paginationDataMap;
	}

	@Override
	public List<NoticeVO> getNoticelistPagination(int page, int limit) {
		// TODO Auto-generated method stub
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		Map<String, Object> dataMap = new HashMap<>();

		dataMap.put("start", startrow);
		dataMap.put("end", endrow);

		return dao.getNoticelistPagination(dataMap);
	}

	@Override
	public NoticeVO getNoticeDetail(int noticedetailnum) {
		return dao.getNoticeDetail(noticedetailnum);
	}

	@Override
	public Map<String, Object> theaterpagination(String theaterId ,int page) {
		Map<String, Object> paginationDataMap = new HashMap<String, Object>();

		int limit = 10; // 한 페이지에 보여줄 갯수

		int listcount = getTheaterNoticeList(theaterId); // 공지사항의 개수

		int maxpage = (listcount + limit - 1) / limit; // 페이지의 갯수

		int startpage = ((page - 1) / 6) * 6 + 1; // 페이지 시작값

		int endpage = startpage + 6 - 1; // 페이지 마지막값

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		paginationDataMap.put("page", page);
		paginationDataMap.put("maxpage", maxpage);
		paginationDataMap.put("startpage", startpage);
		paginationDataMap.put("endpage", endpage);
		paginationDataMap.put("limit", limit);
		return paginationDataMap;
	}

	@Override
	public List<NoticeVO> getTheaterNoticeListPagination(int page, String theaterId, int limit) {
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		Map<String, Object> dataMap = new HashMap<>();

		dataMap.put("start", startrow);
		dataMap.put("end", endrow);
		dataMap.put("theaterId", theaterId);
		
		return dao.getTheaterNoticelistPagination(dataMap);
	}

	@Override
	public int getTheaterNoticeList(String theaterId) {
		// TODO Auto-generated method stub
		return dao.getTheatherNoticeList(theaterId);
	}
	

	

}
