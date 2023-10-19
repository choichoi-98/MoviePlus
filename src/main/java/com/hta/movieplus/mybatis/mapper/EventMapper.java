package com.hta.movieplus.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Event;

@Mapper
public interface EventMapper {
	
	public void insert_event(Event event);
	
	public List<Event> getAllEventList();
	
	public List<Event> getMovieEventList();
	
	public List<Event> getTheaterEventList();
	
	public List<Event> getPromotionEventList();
	
	public List<Event> getCurtaincallEventList();
	
	public int getEventListCount();
	
	public List<Event> getEventList(HashMap<String, Integer> map);

	public Event getDetailEvent(int num);
	
	public int getMovieEventListCount();
	
	public int getTheaterEventListCount();
	
	public int getPromotionEventListCount();
	
	public int getCurtaincallEventListCount();

	public void deleteEvent(int num);
	
}

