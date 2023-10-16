package com.hta.movieplus.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.NoticeVO;

@Mapper
public interface NoticeMapper {

	public void insertNoticeVO(NoticeVO notice);
}
