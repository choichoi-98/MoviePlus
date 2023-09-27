package com.hta.movieplus.service;

import java.util.List;

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
	public List<Theater> getTheaterList() {
		// TODO Auto-generated method stub
		return mapper.getTheaterList();
	}

	@Override
	public void deleteTheater(int num) {
		// TODO Auto-generated method stub
		mapper.deleteTheaterById(num);
		
	}

}
