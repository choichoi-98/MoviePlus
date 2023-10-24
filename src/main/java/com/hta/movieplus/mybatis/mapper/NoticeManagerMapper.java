package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.NoticeVO;

@Mapper
public interface NoticeManagerMapper {
	
	/* 극장별 공지사항 리스트 불러오기 */
	public List<NoticeVO> getManagerNoticeList(String theaterId);

	public int insertNotice(String managernotice);
}
