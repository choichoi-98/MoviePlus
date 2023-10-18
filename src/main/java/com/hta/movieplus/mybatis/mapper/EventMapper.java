package com.hta.movieplus.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Event;

@Mapper
public interface EventMapper {
	
	public void insert_event(Event event);
	
	public List<Event> getAllEventList();
	
	public int getEventListCount();
	
	public List<Event> getEventList(HashMap<String, Integer> map);

	public Event getDetailEvent(int num);
	
}

