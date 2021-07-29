package com.myspring.petshop.manager.product.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.product.vo.ManagerProductVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface ManagerProductService {
	public void addProduct(Map<String, Object> map) throws Exception;
	public List<ProductVO> listProducts(Pagination pagination) throws Exception;
	public List<ProductVO> fewStockProducts(Pagination pagination) throws Exception;
	public int productsCnt() throws Exception;
	public ProductVO getProduct(String p_code) throws Exception;
	public ProductVO getModifyProduct(String p_code) throws Exception;
	public void modifyProduct(Map<String, Object> map) throws Exception;
	public void removeProduct(String p_code) throws Exception;
	public int searchProductsCnt(Map searchMap) throws Exception;
	public List getSearchProducts(Map searchMap) throws Exception;
}
