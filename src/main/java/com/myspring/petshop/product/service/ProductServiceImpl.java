package com.myspring.petshop.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.manager.product.dao.ManagerProductDAO;
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
	public List getBrandProducts(HashMap productInfo) throws Exception {
		
		return productDAO.selectBrandProducts(productInfo);
	}
	
	@Override
	public int productsCnt(ProductVO category) throws Exception {
		
		return productDAO.selectProductsCnt(category);
	}
	
	@Override
	public int brandProductsCnt(String brandName) throws Exception {
		
		return productDAO.selectBrandProductsCnt(brandName);
	}
	
	@Override
	public List getLoveRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectLoveRanking(productInfo);
	}
	
	@Override
	public List getBrandLoveRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectBrandLoveRanking(productInfo);
	}
	
	@Override
	public List getNewRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectNewRanking(productInfo);
	}
	
	@Override
	public List getBrandNewRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectBrandNewRanking(productInfo);
	}
	
	@Override
	public List getLowPriceRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectLowPriceRanking(productInfo);
	}
	
	@Override
	public List getBrandLowPriceRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectBrandLowPriceRanking(productInfo);
	}
	
	@Override
	public List getHighPriceRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectHighPriceRanking(productInfo);
	}
	
	@Override
	public List getBrandHighPriceRanking(HashMap productInfo) throws Exception {
		
		return productDAO.selectBrandHighPriceRanking(productInfo);
	}
	
	@Override
	public List getAllProducts(HashMap productInfo) throws Exception {
		
		return productDAO.selectAllProducts(productInfo);
	}
	
	@Override
	public ProductVO getProduct(String p_code) throws Exception {
		
		return productDAO.selectProduct(p_code);
	}
	
	
	@Override
	public List getNewProducts(HashMap productInfo) throws Exception {
		return productDAO.selectAllNewProducts(productInfo);
	}
	
	@Override
	public List getNewProductsLove(HashMap productInfo) throws Exception {
		return productDAO.selectNewLoveRanking(productInfo);
	}

	@Override
	public List getNewProductsHigh(HashMap productInfo) throws Exception {
		return productDAO.selectNewHighPriceRanking(productInfo);
	}

	@Override
	public List getNewProductsLow(HashMap productInfo) throws Exception {
		return productDAO.selectNewLowPriceRanking(productInfo);
	}
	
	@Override
	public int newProductsCnt() throws Exception {
		return productDAO.selectNewProductsCnt();
	}
	
	@Override
	public int getSearchProductsCnt(String searchWord) throws Exception {
		return productDAO.selectSearchProductsCnt(searchWord);
	}
	
	@Override
	public List<String> keywordSearch(String keyword) throws Exception {
		return productDAO.selectKeywordSearch(keyword);
	}
	
	@Override
	public List<ProductVO> getSearchProducts(Map<String, Object> searchMap) throws Exception {
	
		return productDAO.selectSearchProducts(searchMap);
	}
	
}
