package com.myspring.petshop.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.Pagination;
import com.myspring.petshop.manager.dao.ManagerDAO;
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
	public int membersCnt() throws Exception {
	
		return managerDAO.selectMembersCnt();
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
	
	@Override
	public List getMembersList(Pagination pagination) throws Exception {
		
		return managerDAO.selectMembers(pagination);
	}
	
	@Override
	public boolean removeMembers(int member_num) throws Exception {
		managerDAO.deleteMembers(member_num);
		
		return true;
	}
	
	@Override
	public boolean modMemberGrant(int member_num) throws Exception {
		int result = getMemberManager(member_num);
		
		if(result == 0) {
			managerDAO.updateMemberGrant(member_num);
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public boolean modMemberRevoke(int member_num) throws Exception {
		int result = getMemberManager(member_num);
		
		if(result == 1) {
			managerDAO.updateMemberRevoke(member_num);
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public int searchProductsCnt(Map searchMap) throws Exception {
		
		return managerDAO.selectSearchProductsCnt(searchMap);
	}
	
	@Override
	public List getSearchProducts(Map searchMap) throws Exception {
		
		return managerDAO.selectSearchProducts(searchMap);
	}
	
	private int getMemberManager(int member_num) throws Exception {
		
		return managerDAO.selectMemberManager(member_num);
	}
	
}