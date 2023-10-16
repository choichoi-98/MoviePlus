package com.hta.movieplus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.controller.MembershipService;
import com.hta.movieplus.domain.Member;
import com.hta.movieplus.mybatis.mapper.MembershipMapper;

@Service
public class MembershipServiceImpl implements MembershipService {
	
	MembershipMapper mapper;
	
	@Autowired
	public MembershipServiceImpl(MembershipMapper mapper) {
		// TODO Auto-generated constructor stub
		this.mapper = mapper;
	}

	@Override
	public Member getMemberByName(String name) {
		// TODO Auto-generated method stub
		return mapper.getMemberByName(name);
	}
	

}
