package com.hta.movieplus.service;

import com.hta.movieplus.domain.Member;

public interface MemberService {
	
	public int insert(Member m);
	
	public int isId(String MEMBER_ID, String MEMBER_PASS);
	
	public int isId(String MEMBER_ID);
	
	public Member findId(String MEMBER_NAME, String MEMBER_BIRTH, String MEMBER_PHONENO);

	public Member memberinfo(String MEMBER_ID);

	public void delete(String MEMBER_ID);

	
	
}
