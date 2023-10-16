package com.hta.movieplus.service;

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


	

}
