package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.TheaterRoom;

public interface TheaterManagerService {

	String getRoomName(int theaterId);

	void addTheaterRoom(TheaterRoom theaterRoom);

	int getRoomCountById(int theaterId);

	List<TheaterRoom> getRoomList(int theaterId);

	void deleteRoomById(int room_id);

	void changeStatusRoomById(int room_id, String status);

	TheaterRoom getTheaterRoomById(int room_id);

	void modifyTheaterRoom(TheaterRoom theaterRoom);

	int getTheaterIdByManagerId(String managerId);

}
