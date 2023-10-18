package com.hta.movieplus.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.CartVO;
import com.hta.movieplus.domain.StorePayVO;
import com.hta.movieplus.domain.StoreVO;
import com.hta.movieplus.mybatis.mapper.StoreMapper;

@Service
public class StoreServiceImpl implements StoreService {
	
	private StoreMapper dao;
	
	@Autowired
	public StoreServiceImpl(StoreMapper dao) {
		this.dao = dao;
	}

	@Override
	public int insertItem(StoreVO StoreVO) {
		return dao.insertItem(StoreVO);
	}
	
	@Override
	public StoreVO seleteItem(int ITEM_CODE) {
		return null;
	}

	@Override
	public int updateItem(StoreVO modifyitem) {
		return dao.updateItem(modifyitem);
	}

	@Override
	public void deleteItem(int ITEM_CODE) {
		dao.deleteItem(ITEM_CODE);
	}
	
	@Override
	public void delCartItem(int ITEM_CODE) {
		dao.delCartItem(ITEM_CODE);
	}

	@Override
	public int getItemListCount() {
		return dao.getItemListCount();
	}
	
	@Override
	public StoreVO get1item(int ITEM_CODE) {
		return dao.get1item(ITEM_CODE);
	}

	@Override
	public List<StoreVO> getItemList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getItemList(map);
	}
	
	@Override
	public List<StoreVO> getCartList() {
		return dao.getCartList();
	}

	@Override
	public List<StoreVO> getItemListByKind(String ITEM_MENU) {
	    return dao.getItemListByKind(ITEM_MENU);
	}

	@Override
	public List<StoreVO> getItemListByCodes(List<Integer> codelist) {
		return dao.getItemListByCodes(codelist);
	}

	@Override
	public CartVO cartInsert(CartVO CartVO) {
		dao.cartInsert(CartVO);
		return CartVO;
	}

	@Override
	public void payInsert(String itemDisplay, int totalPrice) {
		dao.payInsert(itemDisplay, totalPrice);
	}

	@Override
	public List<StorePayVO> getPayList() {
		return dao.getPayList();
	}

	@Override
	public void insertPgToken(String pg_token) {
		dao.insertPgToken(pg_token);
	}

	@Override
	public List<StorePayVO> selectApproved() {
		return dao.selectApproved();
	}

	@Override
	public void clearCart() {
		dao.clearCart();
	}

}
