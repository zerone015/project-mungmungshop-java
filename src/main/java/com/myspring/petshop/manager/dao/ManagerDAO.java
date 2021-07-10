package com.myspring.petshop.manager.dao;

import java.util.List;

import com.myspring.petshop.Pagination;
import com.myspring.petshop.manager.vo.ManagerVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface ManagerDAO {
	public void insertProduct(ProductVO product) throws Exception;
	public List selectProducts(Pagination pagination) throws Exception;
	public int selectProductsCnt() throws Exception;
	public ProductVO selectProduct(String p_code) throws Exception;
	public void updateProduct(ProductVO product) throws Exception;
	public void deleteProduct(String p_code) throws Exception;
}
