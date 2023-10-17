package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.Event;

public interface EventService {
	
	public void insert_event(Event event);
	
	public int getEventListCount();

	public List<Event> getEventList(int page, int limit);

	public Event getDetailEvent(int num);
	
	
}
