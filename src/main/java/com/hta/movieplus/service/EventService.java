package com.hta.movieplus.service;

import java.util.List;
import java.util.Map;

import com.hta.movieplus.domain.Event;
import com.hta.movieplus.domain.EventApply;

public interface EventService {
	
	public void insert_event(Event event);
	
	public List<Event> getAllEventList();

	public List<Event> getMovieEventList();
	
	public List<Event> getTheaterEventList();
	
	public List<Event> getPromotionEventList();
	
	public List<Event> getCurtaincallEventList();
	
	public int getEventListCount();

	public List<Event> getEventList(int page, int limit);

	public Event getDetailEvent(int num);
	
	public int getMovieEventListCount();
	
	public int getTheaterEventListCount();
	
	public int getPromotionEventListCount();
	
	public int getCurtaincallEventListCount();

	public void deleteEvent(int num);

	public int updateEvent(Event event);

	public void changeStatus(int num, String status);

	public Map<String, Object> pagination(int page);

	public List<Event> getEventListdesc(int page, int limit);

	public int getEventListCountStatus();

	public Event update_eventResult();




	
	
	
}
