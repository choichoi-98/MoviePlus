package com.hta.movieplus.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Member;

@Mapper
public interface MemberMapper {

	public int insert(Member m);
	
	public Member isId(String MEMBER_ID);

}

