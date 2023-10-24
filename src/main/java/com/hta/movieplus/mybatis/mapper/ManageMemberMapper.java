package com.hta.movieplus.mybatis.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.Member;

@Mapper
public interface ManageMemberMapper {

	int getCountByMember();

	List<Member> getMemberList(Map<String, Object> dataMap);

	int deleteMemberById(int memberNum);

}
