package com.hta.movieplus.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Member;

@Mapper
public interface MemberMapper {

	public Member isId(String MEMBER_ID);
	
	public int insert(Member m);
	
	public Member findId(String MEMBER_NAME, String MEMBER_BIRTH, String MEMBER_PHONENO);

	public Member memberinfo(String MEMBER_ID);
}

