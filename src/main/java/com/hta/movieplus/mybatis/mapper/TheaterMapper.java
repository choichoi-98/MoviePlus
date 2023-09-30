package com.hta.movieplus.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Theater;

@Mapper
public interface TheaterMapper {
	
	public int addTheater(Theater theater);
	
	public int getCountByTheater();

	public List<Theater> getTheaterList();

	public void deleteTheaterById(int num);

	public Theater getTheaterById(int num);

	public void changeStatusTheaterById(Map<String, Object> dataMap);

	public void updateTheaterById(Theater theater);
	
}
