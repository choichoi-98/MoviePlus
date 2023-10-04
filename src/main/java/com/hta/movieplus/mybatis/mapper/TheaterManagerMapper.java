package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.TheaterRoom;

@Mapper
public interface TheaterManagerMapper {

	public int getRoomCountById(int theaterId);

	public void addTheaterRoom(TheaterRoom theaterRoom);

	public List<TheaterRoom> getRoomList(int theaterId);

	public void deleteRoomById(int room_id);

	public void changeStatusRoomById(Map<String, Object> dataMap);

	public TheaterRoom getTheaterRoomById(int room_id);

	public void modifyTheaterRoom(TheaterRoom theaterRoom);

	public int getTheaterIdByManagerId(String managerId);

}
