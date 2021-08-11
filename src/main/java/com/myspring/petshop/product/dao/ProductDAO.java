package com.myspring.petshop.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.product.vo.ProductVO;

public interface ProductDAO {
	public List selectProducts(HashMap productInfo) throws DataAccessException;
	public int selectProductsCnt(ProductVO category) throws DataAccessException;
	public List selectLoveRanking(HashMap productInfo) throws DataAccessException;
	public List selectNewRanking(HashMap productInfo) throws DataAccessException;
	public List selectLowPriceRanking(HashMap productInfo) throws DataAccessException;
	public int selectBrandProductsCnt(String brandName) throws DataAccessException;
	public List selectHighPriceRanking(HashMap productInfo) throws DataAccessException;
	public List selectAllProducts(HashMap productInfo) throws DataAccessException;
	public ProductVO selectProduct(String p_code) throws DataAccessException;
	public int selectNewProductsCnt() throws DataAccessException;
	public List selectAllNewProducts(HashMap productInfo) throws DataAccessException;
	public List selectNewLoveRanking(HashMap productInfo) throws DataAccessException;
	public List selectNewHighPriceRanking(HashMap productInfo) throws DataAccessException;
	public List selectNewLowPriceRanking(HashMap productInfo) throws DataAccessException;
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	public int selectSearchProductsCnt(String searchWord) throws DataAccessException;
	public List<ProductVO> selectSearchProducts(Map<String, Object> searchMap) throws DataAccessException;
	public List selectBrandProducts(HashMap productInfo) throws DataAccessException;
	public List selectBrandLoveRanking(HashMap productInfo) throws DataAccessException;
	public List selectBrandNewRanking(HashMap productInfo) throws DataAccessException;
	public List selectBrandLowPriceRanking(HashMap productInfo) throws DataAccessException;
	public List selectBrandHighPriceRanking(HashMap productInfo) throws DataAccessException;
}
