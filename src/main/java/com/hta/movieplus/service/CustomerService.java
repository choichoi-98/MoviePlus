package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.CustomerOneOnOneVO;
import com.hta.movieplus.domain.NoticeVO;

public interface CustomerService {

	public void insertOneOnOne(CustomerOneOnOneVO oneonone);

	public List<CustomerOneOnOneVO> getMyInjury(int member_NUM);

	public CustomerOneOnOneVO getDetailByNum(int detailnum);

	public int deletemyinjury(int deletenum);

}
