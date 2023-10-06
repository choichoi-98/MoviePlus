package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.CustomerOneOnOneVO;
import com.hta.movieplus.mybatis.mapper.CustomerMapper;

@Service
public class CustomerServiceImpl implements CustomerService {

	CustomerMapper mapper;

	@Autowired
	public CustomerServiceImpl(CustomerMapper mapper) { // 매개변수에 매퍼넣고
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}
	
	@Override
	public void insertOneOnOne(CustomerOneOnOneVO customeroneonone) {
		// TODO Auto-generated method stub
		mapper.insertCumtomerOneOnOneVO(customeroneonone);
	}

	@Override
	public List<CustomerOneOnOneVO> selectOneOnOne() {
		// TODO Auto-generated method stub
		List<CustomerOneOnOneVO> list = mapper.getCustomerOneOnOneVOList(); 
		return list;
	}

	
}
