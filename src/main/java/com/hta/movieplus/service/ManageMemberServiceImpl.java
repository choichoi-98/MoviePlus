package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.mybatis.mapper.ManageMemberMapper;

@Service
public class ManageMemberServiceImpl implements ManageMemberService {

	ManageMemberMapper mapper;

	@Autowired
	public ManageMemberServiceImpl(ManageMemberMapper mapper) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}
	
	@Override
	public int getCountByMember() {
		// TODO Auto-generated method stub
		return mapper.getCountByMember();
	}

	@Override
	public Map<String, Object> pagination(int page) {
		// TODO Auto-generated method stub
		Map<String, Object> paginationDataMap = new HashMap<String, Object>();

		int limit = 10;

		int listcount = getCountByMember();

		int maxpage = (listcount + limit - 1) / limit;

		int startpage = ((page - 1) / 6) * 6 + 1;

		int endpage = startpage + 6 - 1;

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
	public List<Member> getMemberList(String keyword, int page, int limit) {
		// TODO Auto-generated method stub
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;

		Map<String, Object> dataMap = new HashMap<>();

		dataMap.put("start", startrow);
		dataMap.put("end", endrow);
		dataMap.put("keyword", keyword);

		return mapper.getMemberList(dataMap);
	}

	@Override
	public int deleteMemberById(int memberNum) {
		// TODO Auto-generated method stub
		return mapper.deleteMemberById(memberNum);
	}

}
