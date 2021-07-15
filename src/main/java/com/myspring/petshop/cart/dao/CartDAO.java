package com.myspring.petshop.cart.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.cart.vo.CartVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface CartDAO {
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException;
	public List<ProductVO> selectProductsList(int member_num) throws DataAccessException;
	public String selectCountInCart(CartVO cartVO) throws DataAccessException;
	public void insertProductsInCart(CartVO cartVO) throws DataAccessException;
	public void updateCartProductsQty(Map cartMap) throws DataAccessException;
	public int selectProductsStock(String p_code) throws DataAccessException;
	public void deleteCartProducts(String p_code) throws DataAccessException;
}
