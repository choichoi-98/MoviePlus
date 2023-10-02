package com.hta.movieplus.service;

import java.util.List;

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
	public String getRoomName() {
		// TODO Auto-generated method stub
		StringBuilder sb = new StringBuilder();
		sb.append(mapper.getRoomCountById()+1);
		sb.append("관");
		
		return sb.toString();
	}
	
	@Override
	public void addTheaterRoom(TheaterRoom theaterRoom) {
		// TODO Auto-generated method stub
		mapper.addTheaterRoom(theaterRoom);
	}
	@Override
	public int getRoomCountById() {
		// TODO Auto-generated method stub
		return mapper.getRoomCountById();
	}
	@Override
	public List<TheaterRoom> getRoomList() {
		// TODO Auto-generated method stub
		return mapper.getRoomList();
	}

}
