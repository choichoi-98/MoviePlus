package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.CartVO;
import com.hta.movieplus.domain.CouponVO;
import com.hta.movieplus.domain.PayCouponDTO;
import com.hta.movieplus.domain.StoreCartDTO;
import com.hta.movieplus.domain.StorePayVO;
import com.hta.movieplus.domain.StoreVO;

public interface StoreService {
	
	public int insertItem(StoreVO StoreVO);
	
	public StoreVO seleteItem(int ITEM_CODE);
	
	public int updateItem(StoreVO modifyitem);
	
	public void deleteItem(int ITEM_CODE);
	
	public void delCartItem(CartVO cartVO);
	
	public void deletePaidItem(int pAY_NUM);
	
	public int getItemListCount();
	
	public List<StoreVO> getItemList(int page, int limit);
	
	public List<StoreVO> getItemListByKind(String ITEM_MENU);
	
	public StoreVO get1item(int ITEM_CODE);

	public List<StoreVO> getItemListByCodes(List<Integer> codelist);

	public CartVO cartInsert(CartVO CartVO);

	public List<StoreVO> getCartList();
	
	public void payInsert(String itemDisplay, int totalPrice, String MEMBER_ID, String cartItemMenus);
	
	public List<StorePayVO> getPayList();

	public void insertPgToken(String pg_token, String today);

	public List<StorePayVO> selectApproved();

	public void clearCart();

	public List<CartVO> getCartList2();

	public List<StoreCartDTO> getCartLists();

	public String getStoreCoupon();

	public void createCoupon(int PAY_NUM, String Code, String COUPON_TYPE, int COUPON_VALUE);

	public String getPayMenuByNum(int pAY_NUM);

	public List<PayCouponDTO> getStoreCouponList();


}
