package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.FavoriteTheater;
import com.hta.movieplus.domain.Manager;
import com.hta.movieplus.domain.Theater;
import com.hta.movieplus.mybatis.mapper.TheaterMapper;

@Service
public class TheaterServiceImpl implements TheaterService {

	private TheaterMapper mapper;
	private PasswordEncoder passwordEncoder;
	private static final Logger logger = LoggerFactory.getLogger(TheaterServiceImpl.class);

	
	
	@Autowired
	public TheaterServiceImpl(TheaterMapper mapper, PasswordEncoder passwordEncoder) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
		this.passwordEncoder = passwordEncoder;
	}
	
	@Override
	public void addTheater(Theater theater, Manager manager) {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append(theater.getTHEATER_NAME());
		sb.append("관 매니저");
		
		String managerName = sb.toString();
		manager.setMEMBER_NAME(managerName);
		manager.setMEMBER_PASS(passwordEncoder.encode(manager.getMEMBER_PASS()));
		
		theater.setTHEATER_MANAGER_ID(manager.getMEMBER_ID());
		
		mapper.addTheaterManager(manager);
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
		String managerId = mapper.getTheaterById(num).getTHEATER_MANAGER_ID();
		if(mapper.deleteTheaterById(num) == 1) {
			mapper.deleteMemberById(managerId);
		}
		
		
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

	@Override
	public String getManagerId() {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();

		while(true) {
			sb.append("manager");
			sb.append((int) (Math.random() * 9998 + 1));
			
			String managerId = sb.toString();
			
			if(mapper.findManagerIdById(managerId) == 0) {
				return managerId;
			}
		}
	}

	@Override
	public void resetManagerPassword(String theater_MANAGER_ID) {
		// TODO Auto-generated method stub
		String resetPassword = passwordEncoder.encode("movieplus0000");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("THEATER_MANAGER_ID", theater_MANAGER_ID);
		dataMap.put("RESET_PASSWORD", resetPassword);
		
		mapper.resetManagerPasswordById(dataMap);
	}

	@Override
	public List<Theater> getAllTheaterList() {
		// TODO Auto-generated method stub
		
		return mapper.getAllTheaterList();
	}

	@Override
	public List<FavoriteTheater> getFavoriteTheaterListById(String name) {
		// TODO Auto-generated method stub
		return mapper.getFavoriteTheaterListById(name);
	}

	@Override
	public int checkFavoriteTheater(int theaterId, String userId) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("theaterId", theaterId);
		dataMap.put("userId", userId);
		
		return mapper.checkFavoriteTheater(dataMap);
	}

	@Override
	public int deleteFavoriteTheater(int theaterId, String userId) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("theaterId", theaterId);
		dataMap.put("userId", userId);
		
		return mapper.deleteFavoriteTheater(dataMap);
	}

	@Override
	public int addFavoriteTheater(int theaterId, String userId) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap.put("theaterId", theaterId);
		dataMap.put("userId", userId);
		
		return mapper.addFavoriteTheater(dataMap);
	}

}
