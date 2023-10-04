package com.hta.movieplus.service;

import java.util.List;
import java.util.Map;

import com.hta.movieplus.domain.Manager;
import com.hta.movieplus.domain.Theater;

public interface TheaterService {

	public void addTheater(Theater theater, Manager manager);

	public int getCountByTheater();

	public List<Theater> getTheaterList(int page, int limit);

	public void deleteTheater(int num);

	public Theater getTheaterById(int num);

	public void changeStatusTheater(int num, String status);

	public void modifyTheater(Theater theater);

	public Map<String, Object> pagination(int page);

	public String getManagerId();

	public void resetManagerPassword(String theater_MANAGER_ID);

	
	

}
