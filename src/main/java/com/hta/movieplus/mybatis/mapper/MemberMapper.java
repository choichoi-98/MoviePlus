package com.hta.movieplus.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Member;

@Mapper
public class MemberMapper {

	public int insert(Member m);
	
}
