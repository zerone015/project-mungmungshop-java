package com.myspring.petshop.product.dao;

import java.util.HashMap;
import java.util.List;

import com.myspring.petshop.product.vo.ProductVO;

public interface ProductDAO {
	public List selectProducts(HashMap productInfo) throws Exception;
	public int selectProductsCnt(ProductVO category) throws Exception;
	public List selectLoveRanking(HashMap productInfo) throws Exception;
	public List selectNewRanking(HashMap productInfo) throws Exception;
	public List selectLowPriceRanking(HashMap productInfo) throws Exception;
	public List selectHighPriceRanking(HashMap productInfo) throws Exception;
	public List selectAllProducts(HashMap productInfo) throws Exception;
	public ProductVO selectProduct(String p_code) throws Exception;
}
