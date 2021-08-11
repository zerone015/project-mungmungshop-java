package com.myspring.petshop.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myspring.petshop.product.vo.ProductVO;


public interface ProductService {
	public List getProducts(HashMap productInfo) throws Exception;
	public int productsCnt(ProductVO category) throws Exception;
	public int brandProductsCnt(String brandName) throws Exception;
	public List getLoveRanking(HashMap productInfo) throws Exception;
	public List getNewRanking(HashMap productInfo) throws Exception;
	public List getLowPriceRanking(HashMap productInfo) throws Exception;
	public List getHighPriceRanking(HashMap productInfo) throws Exception;
	public List getAllProducts(HashMap productInfo) throws Exception;
	public ProductVO getProduct(String p_code) throws Exception;
	public int newProductsCnt() throws Exception;
	public List getNewProducts(HashMap productInfo) throws Exception;
	public List getNewProductsLove(HashMap productInfo) throws Exception;
	public List getNewProductsHigh(HashMap productInfo) throws Exception;
	public List getNewProductsLow(HashMap productInfo) throws Exception;
	public List<String> keywordSearch(String keyword) throws Exception;
	public int getSearchProductsCnt(String searchWord) throws Exception;
	public List<ProductVO> getSearchProducts(Map<String, Object> searchMap) throws Exception;
	public List getBrandProducts(HashMap productInfo) throws Exception;
	public List getBrandLoveRanking(HashMap productInfo) throws Exception;
	public List getBrandNewRanking(HashMap productInfo) throws Exception;
	public List getBrandLowPriceRanking(HashMap productInfo) throws Exception;
	public List getBrandHighPriceRanking(HashMap productInfo) throws Exception;
	public List<ProductVO> getRankProducts() throws Exception;
}
