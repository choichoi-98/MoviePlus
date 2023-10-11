package com.hta.movieplus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.CartVO;
import com.hta.movieplus.domain.StoreVO;
import com.hta.movieplus.mybatis.mapper.CartMapper;
import com.hta.movieplus.mybatis.mapper.StoreMapper;

@Service
public class CartServiceImpl implements CartService {
	
	private StoreMapper dao;
	private CartMapper cdao;
	
	@Autowired
	public CartServiceImpl(StoreMapper dao, CartMapper cdao) {
		this.dao = dao;
		this.cdao = cdao;
	}

	@Override
	public CartVO addItemToCart(int ITEM_CODE) {
		return cdao.addItemToCart(ITEM_CODE);
	}
	
}
