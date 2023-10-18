package com.hta.movieplus.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.NoticeVO;

@Mapper
public interface NoticeMapper {

	public void insertNoticeVO(NoticeVO notice);

	public List<NoticeVO> getNoticelist(String string);
	
	public List<NoticeVO> getNoticeModify(String string1);
	
	public void deleteNoticeVO(int noticenum); 
	
	public List<NoticeVO> getNoticeModifyList(String string2);
}
