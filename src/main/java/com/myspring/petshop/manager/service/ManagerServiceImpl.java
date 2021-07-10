package com.myspring.petshop.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.Pagination;
import com.myspring.petshop.manager.dao.ManagerDAO;
import com.myspring.petshop.manager.vo.ManagerVO;
import com.myspring.petshop.product.vo.ProductVO;

@Service("managerService")
@Transactional(propagation = Propagation.REQUIRED)
public class ManagerServiceImpl implements ManagerService{
	@Autowired
	private ManagerDAO managerDAO;
	
	@Override
	public void addProduct(ProductVO product) throws Exception {
		managerDAO.insertProduct(product);
	}
	
	@Override
	public List listProducts(Pagination pagination) throws Exception {
		
		return managerDAO.selectProducts(pagination);
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
	public void modifyProduct(ProductVO product) throws Exception {
		managerDAO.updateProduct(product);
	}
	
	@Override
	public void removeProduct(String p_code) throws Exception {
		managerDAO.deleteProduct(p_code);
	}
}
