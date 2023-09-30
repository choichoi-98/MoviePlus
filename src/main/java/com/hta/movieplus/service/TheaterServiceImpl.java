package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.mybatis.mapper.TheaterMapper;

@Service
public class TheaterServiceImpl implements TheaterService {

	private TheaterMapper mapper;
	
	@Autowired
	public TheaterServiceImpl(TheaterMapper mapper) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}
	
	@Override
	public void addTheater(Theater theater) {
		// TODO Auto-generated method stub
		
		// 관리자 id, 비밀번호 생성 -> member에 추가하는 로직
		theater.setTHEATER_MANAGER_ID("temp");
		
		mapper.addTheater(theater);
		
	}

	@Override
	public int getCountByTheater() {
		// TODO Auto-generated method stub
		return mapper.getCountByTheater();
	}


	@Override
	public void deleteTheater(int num) {
		// TODO Auto-generated method stub
		mapper.deleteTheaterById(num);
		
	}

	@Override
	public Theater getTheaterById(int num) {
		// TODO Auto-generated method stub
		return mapper.getTheaterById(num);
		
	}

	@Override
	public void changeStatusTheater(int num, String status) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("num", num);
		dataMap.put("status", status);
		
		mapper.changeStatusTheaterById(dataMap);
	}

	@Override
	public void modifyTheater(Theater theater) {
		// TODO Auto-generated method stub
		mapper.updateTheaterById(theater);
		
	}

	@Override
	public Map<String, Object> pagination(int page) {
		// TODO Auto-generated method stub
		Map<String, Object> paginationDataMap = new HashMap<String, Object>();
		
		int limit = 10;

		int listcount = getCountByTheater();

		int maxpage = (listcount + limit - 1) / limit;

		int startpage = ((page - 1) / 6) * 6 + 1;

		int endpage = startpage + 6 - 1;

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
	public List<Theater> getTheaterList(int page, int limit) {
		// TODO Auto-generated method stub
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		map.put("start", startrow);
		map.put("end", endrow);

		return mapper.getTheaterList(map);
	}

}
