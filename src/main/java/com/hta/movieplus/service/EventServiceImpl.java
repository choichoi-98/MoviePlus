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

	@Override
	public List<Event> getMovieEventList() {
		return dao.getMovieEventList();
	}

	@Override
	public List<Event> getTheaterEventList() {
		return dao.getTheaterEventList();
	}

	@Override
	public List<Event> getPromotionEventList() {
		return dao.getPromotionEventList();
	}

	@Override
	public List<Event> getCurtaincallEventList() {
		return dao.getCurtaincallEventList();
	}

	@Override
	public int getMovieEventListCount() {
		return dao.getMovieEventListCount();
	}

	@Override
	public int getTheaterEventListCount() {
		return dao.getTheaterEventListCount();
	}

	@Override
	public int getPromotionEventListCount() {
		return dao.getPromotionEventListCount();
	}

	@Override
	public int getCurtaincallEventListCount() {
		return dao.getCurtaincallEventListCount();
	}

	@Override
	public void deleteEvent(int num) {
		dao.deleteEvent(num);
	}

	


	

}
