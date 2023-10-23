package com.hta.movieplus.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Event;
import com.hta.movieplus.domain.EventApply;

@Mapper
public interface EventMapper {
	
	public void insert_event(Event event);
	
	public List<Event> getAllEventList();
	
	public List<Event> getMovieEventList();
	
	public List<Event> getTheaterEventList();
	
	public List<Event> getPromotionEventList();
	
	public List<Event> getCurtaincallEventList();
	
	public int getEventListCount();
	
	public List<Event> getEventList(HashMap<String, Object> map);

	public Event getDetailEvent(int num);
	
	public int getMovieEventListCount();
	
	public int getTheaterEventListCount();
	
	public int getPromotionEventListCount();
	
	public int getCurtaincallEventListCount();

	public void deleteEvent(int num);

	public int updateEvent(Event event);

	public void changeStatus(Map<String, Object> map);

	public List<Event> getEventListdesc(HashMap<String, Object> map);

	public int getEventListCountStatus();

	public Event update_eventResult();

	
}

