package com.hta.movieplus.service;

import java.util.List;
import java.util.Map;

import com.hta.movieplus.domain.CustomerOneOnOneVO;
import com.hta.movieplus.domain.NoticeVO;

public interface CustomerService {

	public void insertOneOnOne(CustomerOneOnOneVO oneonone);

	public List<CustomerOneOnOneVO> getMyInjury(int member_NUM);

	public CustomerOneOnOneVO getDetailByNum(int detailnum);

	public int deletemyinjury(int deletenum);

	public CustomerOneOnOneVO goAnserWrite(int cUSTOMER_NUM);

	public void updateOneonone(CustomerOneOnOneVO vO);

	public Map<String, Object> pagination(String theaterId, int page);

	public List<NoticeVO> getListPagination(int page, String theaterId, int i);

	public int getCountList(String theaterId);
	
	
}
