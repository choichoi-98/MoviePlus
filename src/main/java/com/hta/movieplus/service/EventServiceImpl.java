package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Event;
import com.hta.movieplus.mybatis.mapper.EventMapper;

@Service
public class EventServiceImpl implements EventService{
	
	private EventMapper dao;
	
	@Autowired
	public EventServiceImpl(EventMapper dao) {
		this.dao = dao;
	}

	@Override
	public void insert_event(Event event) {
		dao.insert_event(event);
	}
	
	@Override
	public List<Event> getAllEventList() {
		return dao.getAllEventList();
	}
	

	@Override
	public int getEventListCount() {
		return dao.getEventListCount();
	}

	@Override
	public List<Event> getEventList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page-1) * limit + 1;
		int endrow = startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		
		return dao.getEventList(map);
	}

	@Override
	public Event getDetailEvent(int num) {
		return dao.getDetailEvent(num);
	}
	


	

}
