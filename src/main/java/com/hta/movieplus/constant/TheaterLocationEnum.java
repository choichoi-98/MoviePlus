package com.hta.movieplus.constant;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public enum TheaterLocationEnum {
	SEOUL("서울"), GYEONGGI("경기"), INCHEON("인천"), DAECHUNGSAE("대전/충청/세종"), BUDAEGYEONG("부산/대전/경상"),
	GWANGJUN("광주/전라"), GANGWON("강원"), JEJU("제주");
	

	private final String value;
	
	TheaterLocationEnum(String value) {
		// TODO Auto-generated constructor stub
		this.value = value;
	} 
	
	public String getValue() {
		return value;
	}
	

}
