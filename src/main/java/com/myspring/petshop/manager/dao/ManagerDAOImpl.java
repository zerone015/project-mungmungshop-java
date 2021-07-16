package com.myspring.petshop.manager.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.Pagination;
import com.myspring.petshop.manager.vo.ManagerVO;
import com.myspring.petshop.product.vo.ProductVO;

@Repository("managerDAO")
public class ManagerDAOImpl implements ManagerDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertProduct(ProductVO product) throws Exception {
		sqlSession.insert("mapper.manager.insertProduct", product);
	}
	
	@Override
	public List selectProducts(Pagination pagination) throws Exception {
		
		return sqlSession.selectList("mapper.manager.selectProducts", pagination);
	}
	
	@Override
	public int selectProductsCnt() throws Exception {
		
		return sqlSession.selectOne("mapper.manager.selectProductsCnt");
	}
	
	@Override
	public int selectMembersCnt() throws Exception {
		
		return sqlSession.selectOne("mapper.manager.selectMembersCnt");
	}
	
	@Override
	public ProductVO selectProduct(String p_code) throws Exception {
		
		return sqlSession.selectOne("mapper.manager.selectProduct", p_code);
	}
	
	
	@Override
	public void updateProduct(ProductVO product) throws Exception {
		sqlSession.update("mapper.manager.updateProduct", product);
	}
	
	@Override
	public void deleteProduct(String p_code) throws Exception {
		sqlSession.delete("mapper.manager.deleteProduct", p_code);
	}
	
	@Override
	public List selectMembers(Pagination pagination) throws Exception {
		
		return sqlSession.selectList("mapper.manager.selectMembers", pagination);
	}
	
	@Override
	public void deleteMembers(int member_num) throws Exception {
		sqlSession.delete("mapper.manager.deleteMembers", member_num);
	}
	
	@Override
	public void updateMemberGrant(int member_num) throws Exception {
		sqlSession.update("mapper.manager.updateMemberGrant", member_num);
	}
	
	@Override
	public void updateMemberRevoke(int member_num) throws Exception {
		sqlSession.update("mapper.manager.updateMemberRevoke", member_num);
	}
	
	@Override
	public int selectMemberManager(int member_num) throws Exception {
		
		return sqlSession.selectOne("mapper.manager.selectMemberManager", member_num);
	}
	

}