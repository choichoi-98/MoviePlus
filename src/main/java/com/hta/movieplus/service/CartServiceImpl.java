package com.hta.movieplus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.movieplus.domain.CartVO;
import com.hta.movieplus.domain.StoreVO;
import com.hta.movieplus.mybatis.mapper.CartMapper;
import com.hta.movieplus.mybatis.mapper.StoreMapper;

@Service
public class CartServiceImpl implements CartService {
	
	private StoreMapper sdao;
	private CartMapper dao;
	
	@Autowired
	public CartServiceImpl(StoreMapper sdao, CartMapper dao) {
		this.sdao = sdao;
		this.dao = dao;
	}

	@Override
	public int addItemToCart(CartVO CartVO) {
		return dao.addItemToCart(CartVO);
	}

	@Override
	public List<StoreVO> getCodeList() {
		return dao.getCodeList();
	}

	
}
