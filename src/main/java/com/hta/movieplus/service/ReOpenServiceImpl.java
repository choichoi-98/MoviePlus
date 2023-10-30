package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Movie;
import com.hta.movieplus.domain.ReOpenVO;
import com.hta.movieplus.mybatis.mapper.ReOpenMapper;

@Service
public class ReOpenServiceImpl implements ReOpenService {

	ReOpenMapper dao;
	
	@Autowired
	public ReOpenServiceImpl(ReOpenMapper dao) {
		this.dao = dao;
	}

	@Override
	public List<Movie> getEndedMovieList() {
		return dao.getEndedMovieList();
	}
	
	@Override
	public void insertReOpenExpectMovieImformation(String movieCode) {
		
		if(dao.insertReOpenExpectMovieImformation(movieCode) > 0) {
			dao.updateExpectReOpening(movieCode);
		}
	}

	@Override
	public List<ReOpenVO> getExpectMovieList() {
		return dao.getExpectMovieList();
	}

	@Override
	public void cancelReOpen(String cancelcode) {
		
		if(dao.cancelReOpen(cancelcode) > 0) {
			dao.updateReOpenCancel(cancelcode);
		}
		
	}

	@Override
	public Map<String, Object> pagination(int page, String option) {
		Map<String, Object> paginationDataMap = new HashMap<String, Object>();

		int limit = 10; // 한 페이지에 보여줄 갯수

		int listcount = -1;	
		
		if (option.equals("재개봉")) {
			listcount = getCountByReopen();
		} else if(option.equals("상영종료")) {
			listcount = getCountByEndMovieList();
		}
		
		/* int listcount = getCountByReopen(); */
		
		int pagination_max = 6;

		int maxpage = (listcount + limit - 1) / limit; // 페이지의 갯수

		int startpage = ((page - 1) / pagination_max) * pagination_max + 1; // 페이지 시작값

		int endpage = startpage + pagination_max - 1; // 페이지 마지막값

		if (endpage > maxpage) {
			endpage = maxpage;
		}

		paginationDataMap.put("page", page);
		paginationDataMap.put("maxpage", maxpage);
		paginationDataMap.put("startpage", startpage);
		paginationDataMap.put("endpage", endpage);
		paginationDataMap.put("limit", limit);
		
		return paginationDataMap;
	}

	@Override
	public List<ReOpenVO> getReopenlistPagination(int page, int limit) {
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		Map<String, Object> dataMap = new HashMap<>();

		dataMap.put("start", startrow);
		dataMap.put("end", endrow);

		return dao.getReopenlistPagination(dataMap);
	}

	@Override
	public int getCountByReopen() {
		return dao.getCountByReopen();
	}

	@Override
	public int getCountByEndMovieList() {
		return dao.getCountByEndMovieList();
	}

	@Override
	public List<Movie> getEndMovieListPagination(int page, int limit) {
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		Map<String, Object> dataMap = new HashMap<>();

		dataMap.put("start", startrow);
		dataMap.put("end", endrow);
		return dao.getEndMovieListPagination(dataMap);
	}
	
}
