package com.hta.movieplus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.Member;
import com.hta.movieplus.mybatis.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	private MemberMapper dao;
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	public MemberServiceImpl(MemberMapper dao, PasswordEncoder passwordEncoder) {
		this.dao = dao;
		this.passwordEncoder = passwordEncoder;
	}

	
	@Override	//아이디 존재여부 확인
	public int isId(String MEMBER_ID) {
		Member rmember = dao.isId(MEMBER_ID);
		return (rmember==null)? -1 : 1;		//아이디가 존재하는 경우 1, 존재하지 않는 경우 -1 리턴
	}

	@Override   //로그인
	public int isId(String MEMBER_ID, String MEMBER_PASS) {
		Member dbmember = dao.isId(MEMBER_ID);
		int result = -1; 	//아이디가 존재하지 않는 경우 - null인 경우
		if(dbmember != null) {	//아이디가 존재하는경우
			
			if(passwordEncoder.matches(MEMBER_PASS, dbmember.getMEMBER_PASS())) {
				result = 1;	//아이디와 비밀번호가 일치하는 경우
			} else
				result = 0;	//아이디는 존재하지만 비밀번호가 일치하지 않는 경우
		}
		return result;
	}

	@Override	//회원가입 
	public int insert(Member m) {
		int result = dao.insert(m);
		return (result == 0)? -1 : 1;
	}


	@Override
	public Member findId(String MEMBER_NAME, String MEMBER_BIRTH, String MEMBER_PHONENO) {
		return  dao.findId(MEMBER_NAME, MEMBER_BIRTH, MEMBER_PHONENO);
	}


	@Override
	public Member memberinfo(String MEMBER_ID) {
		return dao.isId(MEMBER_ID);
	}


	@Override
	public void delete(String MEMBER_ID) {
		dao.delete(MEMBER_ID);
	}




	
	

}
