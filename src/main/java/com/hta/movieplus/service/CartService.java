package com.hta.movieplus.service;

import java.util.List;

import com.hta.movieplus.domain.CartVO;
import com.hta.movieplus.domain.StoreVO;

public interface CartService {
	
	public int addItemToCart(CartVO CartVO);

	public List<StoreVO> getCodeList();

}
