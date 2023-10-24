package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.CustomerOneOnOneVO;
import com.hta.movieplus.domain.NoticeVO;
import com.hta.movieplus.mybatis.mapper.CustomerMapper;

@Service
public class CustomerServiceImpl implements CustomerService {

	CustomerMapper dao; // 매퍼와 연결하는 부분

	@Autowired
	public CustomerServiceImpl(CustomerMapper dao) {
		this.dao = dao;
	}

	@Override
	public void insertOneOnOne(CustomerOneOnOneVO oneonone) {
		// 얘가 해야하는 기능은 DB에 값을 보내주는 역할임
		dao.insertCustomerOneOnOneVO(oneonone);
	}

	
	@Override /* 공지사항불러오기 */
	public List<NoticeVO> getNoticeList() {
	return dao.getNoticeList(); 
	}
	
}
