package com.hta.movieplus.service;

import java.util.List;
import java.util.Map;

import com.hta.movieplus.domain.NoticeVO;

public interface NoticePaginationService {

	Map<String, Object> pagination(String keyword, int page, String option);

	int getNoticeListCountByOption(String option, String keyword);

	List<NoticeVO> getNoticeList(String keyword, int page, String option, int limit);

}
