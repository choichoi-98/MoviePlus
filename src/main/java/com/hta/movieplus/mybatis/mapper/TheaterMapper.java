package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Theater;

@Mapper
public interface TheaterMapper {
	
	public int addTheater(Theater theater);
	
	public int getCountByTheater();

	public List<Theater> getTheaterList();
	
}
