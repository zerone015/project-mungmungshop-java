package com.myspring.petshop.cart.service;

import java.util.List;
import java.util.Map;

import com.myspring.petshop.cart.vo.CartVO;

public interface CartService {
	public boolean findCartProducts(CartVO cartVO) throws Exception;
	public void addProductsInCart(CartVO cartVO) throws Exception;
	public Map<String, List> getMyCartList(CartVO cartVO) throws Exception;
	public boolean modifyCartQty(Map cartMap) throws Exception;
}
