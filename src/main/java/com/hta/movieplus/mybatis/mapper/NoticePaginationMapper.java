package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.NoticeVO;

@Mapper
public interface NoticePaginationMapper {

	int getNoticeListCountByOption(Map<String, Object> dataMap);

	List<NoticeVO> getNoticeList(Map<String, Object> dataMap);

}
