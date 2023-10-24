package com.hta.movieplus.service;

import java.util.List;
import java.util.Map;

import com.hta.movieplus.domain.Member;

public interface ManageMemberService {

	int getCountByMember();

	Map<String, Object> pagination(int page);

	List<Member> getMemberList(String keyword, int page, int limit);

	int deleteMemberById(int memberNum);

}
