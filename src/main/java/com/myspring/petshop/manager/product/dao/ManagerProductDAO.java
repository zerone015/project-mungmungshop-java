package com.myspring.petshop.manager.product.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.product.vo.ProductVO;

public interface ManagerProductDAO {
	public void insertProduct(Map<String, Object> map) throws Exception;
	public List<ProductVO> selectProducts(Pagination pagination) throws Exception;
	public List<ProductVO> selectFewStockProducts(Pagination pagination) throws Exception;
	public int selectProductsCnt() throws Exception;
	public ProductVO selectProduct(String p_code) throws Exception;
	public void updateProduct(Map<String, Object> map) throws Exception;
	public void deleteProduct(String p_code) throws Exception;
	public int selectSearchProductsCnt(Map searchMap) throws Exception;
	public List selectSearchProducts(Map searchMap) throws Exception;
}
