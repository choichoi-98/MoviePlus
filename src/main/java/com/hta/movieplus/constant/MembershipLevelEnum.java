package com.hta.movieplus.constant;

public enum MembershipLevelEnum {
	Welcome(0), Friends(6000), VIP(12000), VVIP(16000), MVIP(24000);

	private int point;

	MembershipLevelEnum(int point) {
		// TODO Auto-generated constructor stub
		this.point = point;
	}
}
