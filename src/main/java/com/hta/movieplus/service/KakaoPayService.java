package com.hta.movieplus.service;

import com.hta.movieplus.domain.Member;

public interface KakaoPayService {
	
	public int insert(Member m);
	
	public int isId(String MEMBER_ID, String MEMBER_PASS);
	
	public int isId(String MEMBER_ID);

}
