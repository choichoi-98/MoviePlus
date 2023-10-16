package com.hta.movieplus.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Event;

@Mapper
public interface EventMapper {
	
	public void insert_event(Event event);
	
}

