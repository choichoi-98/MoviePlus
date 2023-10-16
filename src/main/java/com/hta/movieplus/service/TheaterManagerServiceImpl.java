package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.TheaterRoom;
import com.hta.movieplus.mybatis.mapper.TheaterManagerMapper;

@Service
public class TheaterManagerServiceImpl implements TheaterManagerService {

	TheaterManagerMapper mapper;
	
	@Autowired
	public TheaterManagerServiceImpl(TheaterManagerMapper mapper) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}
	@Override
	public String getRoomName(int theaterId) {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append(mapper.getRoomCountById(theaterId)+1);
		sb.append("관");
		
		return sb.toString();
	}
	
	@Override
	public void addTheaterRoom(TheaterRoom theaterRoom) {
		// TODO Auto-generated method stub
		
		
		
		
		mapper.addTheaterRoom(theaterRoom);
	}
	@Override
	public int getRoomCountById(int theaterId) {
		// TODO Auto-generated method stub
		return mapper.getRoomCountById(theaterId);
	}
	@Override
	public List<TheaterRoom> getRoomList(int theaterId) {
		// TODO Auto-generated method stub
		return mapper.getRoomList(theaterId);
	}
	@Override
	public void deleteRoomById(int room_id) {
		// TODO Auto-generated method stub
		mapper.deleteRoomById(room_id);
	}
	@Override
	public void changeStatusRoomById(int num, String status) {
		// TODO Auto-generated method stub
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("num", num);
		dataMap.put("status", status);
		mapper.changeStatusRoomById(dataMap);
	}
	@Override
	public TheaterRoom getTheaterRoomById(int room_id) {
		// TODO Auto-generated method stub
		return mapper.getTheaterRoomById(room_id);
	}
	@Override
	public void modifyTheaterRoom(TheaterRoom theaterRoom) {
		// TODO Auto-generated method stub
		mapper.modifyTheaterRoom(theaterRoom);
	}
	@Override
	public int getTheaterIdByManagerId(String managerId) {
		// TODO Auto-generated method stub
		return mapper.getTheaterIdByManagerId(managerId);
	}
	
	

}
