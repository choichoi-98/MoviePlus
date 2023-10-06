package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.CustomerOneOnOneVO;

public interface CustomerService {

	public void insertOneOnOne(CustomerOneOnOneVO customeroneonone);
	
	public List<CustomerOneOnOneVO> selectOneOnOne();

}
