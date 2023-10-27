package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.NoticeVO;

@Mapper
public interface NoticeMapper {
	
	public List<NoticeVO> getNoticelist(String string); // DB에서 공지사항 리스트를 불러옴

	public void noticeWrite(NoticeVO notice); //공지사항 DB 입력
	
	public NoticeVO getNoticeModify(int getmodify); // DB에서 공지사항 수정하기 전 기존의 내용을 가져옴
	
	public void deleteNoticeVO(int noticenum); 
	
	public void noticeModify(NoticeVO modify);
	
	public List<NoticeVO> getNoticelistExceptEntire();

	public List<NoticeVO> getTotalNoticeList();

	public int getCountByNotice();

	public List<NoticeVO> getNoticelistPagination(Map<String, Object> dataMap);
	
	
	/* public void noticeModify(int modify); */
}
