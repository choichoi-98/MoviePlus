package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Event;

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
	
	
	
}
