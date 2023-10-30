package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.CustomerOneOnOneVO;
import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.mybatis.mapper.CustomerMapper;
import com.hta.movieplus.mybatis.mapper.TheaterMapper;

@Service
public class CustomerServiceImpl implements CustomerService {

	CustomerMapper dao; // 매퍼와 연결하는 부분
	TheaterMapper theatermapper;

	@Autowired
	public CustomerServiceImpl(CustomerMapper dao, TheaterMapper theatermapper) {
		this.dao = dao;
		this.theatermapper = theatermapper;
	}

	@Override
	public void insertOneOnOne(CustomerOneOnOneVO oneonone) {
		// 얘가 해야하는 기능은 DB에 값을 보내주는 역할임
		dao.insertCustomerOneOnOneVO(oneonone);
	}

	@Override
	public List<CustomerOneOnOneVO> getMyInjury(int member_NUM) {
		return dao.getMyInjury(member_NUM);
	}

	@Override
	public CustomerOneOnOneVO getDetailByNum(int detailnum) {
		return dao.getDetailByNum(detailnum);
	}

	@Override
	public int deletemyinjury(int deletenum) {
		return dao.deletemyinjury(deletenum);
	}

	@Override
	public CustomerOneOnOneVO goAnserWrite(int cUSTOMER_NUM) {
		return dao.goAnserWrite(cUSTOMER_NUM);
	}

	@Override
	public void updateOneonone(CustomerOneOnOneVO vO) {
		int num = vO.getCUSTOMER_NUM();
		dao.updateOneonone(num);
		// 방법 2개
		// 1. VO에다가 아까 한거처럼 set을해서 대기를 답변완료로 바꾼 vo를 통채로 mapper로 보내서 하는거
		// 2. VO에 있는 pk만 뽑아내서 pk만 mapper로 보내서 하는 방법
	}

	@Override
	public Map<String, Object> pagination(String theaterId, int page) {
		Map<String, Object> paginationDataMap = new HashMap<String, Object>();

		int limit = 10; // 한 페이지에 보여줄 갯수

		int listcount = getCountList(theaterId); // 공지사항의 개수

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
	public List<NoticeVO> getListPagination(int page, String theaterId, int limit) {
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		Map<String, Object> dataMap = new HashMap<>();

		Theater theater = theatermapper.getTheaterById(Integer.parseInt(theaterId));
		dataMap.put("start", startrow);
		dataMap.put("end", endrow);
		dataMap.put("theaterName", theater.getTHEATER_NAME());
		
		return dao.getListPagination(dataMap);
	}

	@Override
	public int getCountList(String theaterId) {
		Theater theater = theatermapper.getTheaterById(Integer.parseInt(theaterId));
		
		return dao.getCountList(theater.getTHEATER_NAME());
	}
}
