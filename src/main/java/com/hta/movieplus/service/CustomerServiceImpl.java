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

	@Override
	public List<CustomerOneOnOneVO> getMyInjury(int member_NUM) {
		return dao.getMyInjury(member_NUM);
	}

	@Override
	public CustomerOneOnOneVO getDetailByNum(int detailnum) {
		return dao.getDetailByNum(detailnum);
	}

	@Override
	public int deletemyinjury(int deletenum) {
		return dao.deletemyinjury(deletenum);
	}

	@Override
	public CustomerOneOnOneVO goAnserWrite(int cUSTOMER_NUM) {
		return dao.goAnserWrite(cUSTOMER_NUM);
	}

	@Override
	public void updateOneonone(CustomerOneOnOneVO vO) {
		int num = vO.getCUSTOMER_NUM();
		dao.updateOneonone(num);
		// 방법 2개
		// 1. VO에다가 아까 한거처럼 set을해서 대기를 답변완료로 바꾼 vo를 통채로 mapper로 보내서 하는거
		// 2. VO에 있는 pk만 뽑아내서 pk만 mapper로 보내서 하는 방법
	}
}
