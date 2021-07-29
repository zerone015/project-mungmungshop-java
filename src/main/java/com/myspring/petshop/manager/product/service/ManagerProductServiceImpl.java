package com.myspring.petshop.manager.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.product.dao.ManagerProductDAO;
import com.myspring.petshop.product.vo.ProductVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ManagerProductServiceImpl implements ManagerProductService{
	@Autowired
	private ManagerProductDAO managerDAO;
	
	@Override
	public void addProduct(Map<String, Object> map) throws Exception {
		managerDAO.insertProduct(map);
	}
	
	@Override
	public List<ProductVO> listProducts(Pagination pagination) throws Exception {  
		
		return managerDAO.selectProducts(pagination);
	}
	
	@Override
	public List<ProductVO> fewStockProducts(Pagination pagination) throws Exception { 
		
		return managerDAO.selectFewStockProducts(pagination);
	}
	
	@Override
	public int productsCnt() throws Exception {
	
		return managerDAO.selectProductsCnt();
	}
	
	@Override
	public ProductVO getProduct(String p_code) throws Exception {
		 
		return managerDAO.selectProduct(p_code);
	}
	
	@Override
	public ProductVO getModifyProduct(String p_code) throws Exception {
		
		return managerDAO.selectProduct(p_code);
	}
	
	@Override
	public void modifyProduct(Map<String, Object> map) throws Exception {
		managerDAO.updateProduct(map);
	}
	
	@Override
	public void removeProduct(String p_code) throws Exception {
		managerDAO.deleteProduct(p_code);
	}
	
	
	@Override
	public int searchProductsCnt(Map searchMap) throws Exception {
		
		return managerDAO.selectSearchProductsCnt(searchMap);
	}
	
	@Override
	public List getSearchProducts(Map searchMap) throws Exception {
		
		return managerDAO.selectSearchProducts(searchMap);
	}
	
}