package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.mybatis.mapper.NoticePaginationMapper;

import org.springframework.stereotype.Service;

@Service
public class NoticePaginiationServiceImpl implements NoticePaginationService {
	
	NoticePaginationMapper mapper;
	
	public NoticePaginiationServiceImpl(NoticePaginationMapper mapper) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}
	
	
	@Override
	public int getNoticeListCountByOption(String option, String keyword) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("option", option);
		dataMap.put("keyword", keyword);
		
		return mapper.getNoticeListCountByOption(dataMap);
	}
	
	
	@Override
	public Map<String, Object> pagination(String keyword, int page, String option) {
		Map<String, Object> pagemap = new HashMap<String,Object>();
		
		int limit = 10;	//한 화면에 출력할 로우 갯수
		
		int noticeCount = getNoticeListCountByOption(option, keyword);
		
		//총 페이지 수
		int maxpage = (noticeCount + limit - 1) / limit;
		
		//현재 페이지에 보여줄 시작 페이지 수
		int startpage = ((page - 1)/10) * 10 + 1;
		
		//현재 페이지에 보여줄 마지막 페이지 수
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		pagemap.put("page", page);
		pagemap.put("maxpage",maxpage);
		pagemap.put("startpage",startpage);
		pagemap.put("endpage",endpage);
		pagemap.put("limit",limit);
		
		return pagemap;
	}



	@Override
	public List<NoticeVO> getNoticeList(String keyword, int page, String option, int limit) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		Map<String, Object> dataMap = new HashMap<>();

		dataMap.put("start", startrow);
		dataMap.put("end", endrow);
		dataMap.put("keyword", keyword);
		dataMap.put("option", option);

		return mapper.getNoticeList(dataMap);
	}

}
