package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Theater;

public interface TheaterService {

	public void addTheater(Theater theater);

	public int getCountByTheater();

	public List<Theater> getTheaterList();

	public void deleteTheater(int num);

	public Theater getTheaterById(int num);

	public void changeStatusTheater(int num, String status);

	public void modifyTheater(Theater theater);
	
	

}
