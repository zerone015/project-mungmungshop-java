package com.myspring.petshop.product.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.manager.dao.ManagerDAO;
import com.myspring.petshop.product.dao.ProductDAO;
import com.myspring.petshop.product.vo.ProductVO;

@Service("productService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
	
	@Override
	public List getProducts(HashMap productInfo) throws Exception {
		
		return productDAO.selectProducts(productInfo);
	}
	
	@Override
	public int productsCnt(ProductVO category) throws Exception {
		
		return productDAO.selectProductsCnt(category);
	}
	
	@Override
	public List getLoveRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectLoveRanking(productInfo);
	}
	
	@Override
	public List getNewRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectNewRanking(productInfo);
	}
	
	@Override
	public List getLowPriceRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectLowPriceRanking(productInfo);
	}
	
	@Override
	public List getHighPriceRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectHighPriceRanking(productInfo);
	}
	
	@Override
	public List getAllProducts(HashMap productInfo) throws Exception {
		
		return productDAO.selectAllProducts(productInfo);
	}
	
	@Override
	public ProductVO getProduct(String p_code) throws Exception {
		
		return productDAO.selectProduct(p_code);
	}
	
}
