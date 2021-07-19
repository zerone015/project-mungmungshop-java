package com.myspring.petshop.manager.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.Pagination;
import com.myspring.petshop.manager.vo.ManagerVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface ManagerService {
	public void addProduct(ProductVO product) throws Exception;
	public List listProducts(Pagination pagination) throws Exception;
	public int productsCnt() throws Exception;
	public int membersCnt() throws Exception;
	public ProductVO getProduct(String p_code) throws Exception;
	public ProductVO getModifyProduct(String p_code) throws Exception;
	public void modifyProduct(ProductVO product) throws Exception;
	public void removeProduct(String p_code) throws Exception;
	public List getMembersList(Pagination pagination) throws Exception;
	public boolean removeMembers(int member_num) throws Exception;
	public boolean modMemberGrant(int member_num) throws Exception;
	public boolean modMemberRevoke(int member_num) throws Exception;
	public int searchProductsCnt(Map searchMap) throws Exception;
	public List getSearchProducts(Map searchMap) throws Exception;
}
