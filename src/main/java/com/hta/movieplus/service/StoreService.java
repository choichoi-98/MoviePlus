package com.hta.movieplus.service;

import java.util.List;
import com.hta.movieplus.domain.StoreVO;

public interface StoreService {
	
	public void insertItem(StoreVO StoreVO);
	
	public StoreVO itemDetail(int num);
	
	public int itemModify(StoreVO modifyitem);
	
	public List<StoreVO> getItemList(int page, int limit);
	
	public int itemDelete(int num);

	public boolean isAdmin(int num, String pass);
	
	public List<String> DeleteItemFileList();

	public void deleteItemFileList(String filename);

}
