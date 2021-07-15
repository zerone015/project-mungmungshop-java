package com.myspring.petshop.cart.service;

import java.util.List;
import java.util.Map;

import com.myspring.petshop.cart.vo.CartVO;

public interface CartService {
	public String findCartProducts(CartVO cartVO) throws Exception;
	public void addProductsInCart(CartVO cartVO) throws Exception;
	public Map<String, List> getMyCartList(CartVO cartVO) throws Exception;
	public String modifyCartQty(Map cartMap) throws Exception;
	public int getProductsStock(String p_code) throws Exception;
	public void removeCartProducts(String p_code) throws Exception;
}
