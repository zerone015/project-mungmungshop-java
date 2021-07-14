package com.myspring.petshop.cart.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.cart.vo.CartVO;
import com.myspring.petshop.product.vo.ProductVO;



@Repository("cartDAO")
public class CartDAOImpl implements CartDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList = sqlSession.selectList("mapper.cart.selectCartList", cartVO);
		
		return cartList;
	}
	
	public List<ProductVO> selectProductsList(int member_num) throws DataAccessException {
		List<ProductVO> myProductsList;
		myProductsList = sqlSession.selectList("mapper.cart.selectProductsList", member_num);
		
		return myProductsList;
	}
	
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.cart.selectCountInCart", cartVO);
		return Boolean.parseBoolean(result);
	}
	
	public void insertProductsInCart(CartVO cartVO) throws DataAccessException {
		int cart_code = selectMaxCartCode();
		cartVO.setCart_code(cart_code);
		sqlSession.insert("mapper.cart.insertProductsInCart", cartVO);
	}
	
	public void updateCartProductsQty(Map cartMap) throws DataAccessException {
		sqlSession.update("mapper.cart.updateCartProductsQty", cartMap);
	}
	
	private int selectMaxCartCode() throws DataAccessException {
		int cart_code = sqlSession.selectOne("mapper.cart.selectMaxCartId");
		return cart_code;
	}
	
}
