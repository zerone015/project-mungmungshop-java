package com.myspring.petshop.manager.dao;

import java.util.List;

import com.myspring.petshop.Pagination;
import com.myspring.petshop.manager.vo.ManagerVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface ManagerDAO {
	public void insertProduct(ProductVO product) throws Exception;
	public List selectProducts(Pagination pagination) throws Exception;
	public int selectProductsCnt() throws Exception;
	public int selectMembersCnt() throws Exception;
	public ProductVO selectProduct(String p_code) throws Exception;
	public void updateProduct(ProductVO product) throws Exception;
	public void deleteProduct(String p_code) throws Exception;
	public List selectMembers(Pagination pagination) throws Exception;
	public void deleteMembers(int member_num) throws Exception;
	public void updateMemberGrant(int member_num) throws Exception;
	public void updateMemberRevoke(int member_num) throws Exception;
	public int selectMemberManager(int member_num) throws Exception;
}
