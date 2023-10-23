package com.hta.movieplus.mybatis.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.movieplus.domain.CartVO;
import com.hta.movieplus.domain.CouponVO;
import com.hta.movieplus.domain.StoreCartDTO;
import com.hta.movieplus.domain.StorePayVO;
import com.hta.movieplus.domain.StoreVO;
/*
	Mapper 인터페이스란 매퍼 파일에 기재된 SQL을 호출하기 위한 인터페이스입니다.
	MyBatis-Spring은 Mapper 인터페이스를 이용해서 실제 SQL 처리가 되는 클래스를 자동으로 생성합니다.
*/
@Mapper
public interface StoreMapper {
	
	public StoreVO seleteItem(int ITEM_CODE);
	
	public int insertItem(StoreVO StoreVO);
	
	public int updateItem(StoreVO modifyitem);
	
	public void deleteItem(int ITEM_CODE);
	
	public List<StoreVO> getItemList(HashMap<String, Integer> map);
	
	public List<StoreVO> getItemListByKind(String iTEM_MENU);

	public int getItemListCount();

	public StoreVO get1item(int iTEM_CODE);

	public List<StoreVO> getItemListByCodes(List<Integer> codelist);

	public void cartInsert(CartVO CartVO);

	public List<StoreVO> getCartList();

	public void delCartItem(CartVO cartVO);

	public void payInsert(String itemDisplay, int totalPrice, String MEMBER_ID);
	
	public List<StorePayVO> getPayList();

	public void insertPgToken(String pg_token);

	public List<StorePayVO> selectApproved();

	public void clearCart();

	public List<CartVO> getCartList2();

	public List<StoreCartDTO> getCartLists();

	public List<CouponVO> getgetCouponList();

}
