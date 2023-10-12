package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.CartVO;
import com.hta.movieplus.domain.StoreVO;

public interface StoreService {
	
	public int insertItem(StoreVO StoreVO);
	
	public StoreVO seleteItem(int ITEM_CODE);
	
	public int updateItem(StoreVO modifyitem);
	
	public void deleteItem(int ITEM_CODE);
	
	public int getItemListCount();
	
	public List<StoreVO> getItemList(int page, int limit);
	
	public List<StoreVO> getItemListByKind(String ITEM_MENU);
	
	public StoreVO get1item(int ITEM_CODE);

	public List<StoreVO> getItemListByCodes(List<Integer> codelist);

	public int cartInsert(int ITEM_CODE);

	
//	public boolean isAdmin(int num, String pass);
//	
//	public List<String> DeleteItemFileList();
//
//	public void deleteItemFileList(String filename);

}
