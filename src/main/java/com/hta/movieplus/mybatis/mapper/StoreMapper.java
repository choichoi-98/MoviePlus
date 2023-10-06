package com.hta.movieplus.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.StoreVO;
/*
	Mapper 인터페이스란 매퍼 파일에 기재된 SQL을 호출하기 위한 인터페이스입니다.
	MyBatis-Spring은 Mapper 인터페이스를 이용해서 실제 SQL 처리가 되는 클래스를 자동으로 생성합니다.
*/
@Mapper
public interface StoreMapper {
	
	public StoreVO seleteitem(int itemCode);
	
	public int insertItem(StoreVO StoreVO);
	
	public int updateItem(StoreVO modifyitem);
	
	public void deleteItem(int itemCode);
	
	public List<StoreVO> getItemList(HashMap<String, Integer> map);

	public int getItemListCount();

	public StoreVO get1item(int iTEM_CODE);
	
//	public int getListCount();
//	
//	public List<StoreVO> getItemList(HashMap<String, Integer> map);
//	
//	public StoreVO isAdmin(Map<String, Object> map);
//	
//	public List<String> getDeleteItemFileList();
//
//	public void deleteItemFileList(String filename);
	
}
