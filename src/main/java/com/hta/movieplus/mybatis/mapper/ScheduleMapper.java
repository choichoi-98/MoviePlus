package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.TheaterSchedule;

@Mapper
public interface ScheduleMapper {

	List<TheaterSchedule> getScheduleList(int theaterId);

}
