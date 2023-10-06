package com.hta.movieplus.service;

import java.util.List;
import com.hta.movieplus.domain.StoreVO;

public interface StoreService {
	
	public int insertItem(StoreVO StoreVO);
	
	public StoreVO seleteitem(int itemCode);
	
	public int updateItem(StoreVO modifyitem);
	
	public void deleteItem(int itemCode);
	
//	public List<StoreVO> getItemList(int page, int limit);
//
//	public boolean isAdmin(int num, String pass);
//	
//	public List<String> DeleteItemFileList();
//
//	public void deleteItemFileList(String filename);

}
