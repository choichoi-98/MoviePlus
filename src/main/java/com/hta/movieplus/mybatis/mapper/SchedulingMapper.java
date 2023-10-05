package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.TheaterSchedule;

@Mapper
public interface SchedulingMapper {

	List<TheaterSchedule> getScheduleList(Map<String, Object> dataMap);

}
