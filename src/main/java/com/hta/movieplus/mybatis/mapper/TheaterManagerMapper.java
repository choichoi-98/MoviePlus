package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.TheaterRoom;

@Mapper
public interface TheaterManagerMapper {

	public int getRoomCountById();

	public void addTheaterRoom(TheaterRoom theaterRoom);

	public List<TheaterRoom> getRoomList();

}
