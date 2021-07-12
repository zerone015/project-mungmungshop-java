package com.myspring.petshop.cart.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.cart.dao.CartDAO;
import com.myspring.petshop.cart.vo.CartVO;
import com.myspring.petshop.product.vo.ProductVO;

@Service("cartService")
@Transactional(propagation = Propagation.REQUIRED)
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;
	
	public boolean findCartProducts(CartVO cartVO) throws Exception {
		return cartDAO.selectCountInCart(cartVO);
	}
	
	public void addProductsInCart(CartVO cartVO) throws Exception {
		cartDAO.insertProductsInCart(cartVO);
	}
	
	public Map<String, List> getMyCartList(CartVO cartVO) throws Exception {
		Map<String, List> cartMap = new HashMap<String, List>();
		List<CartVO> myCartList = cartDAO.selectCartList(cartVO);
		if(myCartList.size()==0) {
			return null;
		}
		List<ProductVO> myProductsList = cartDAO.selectProductsList(myCartList);
		cartMap.put("myCartList", myCartList);
		cartMap.put("myGoodsList", myProductsList);
		return cartMap;
	}
}
