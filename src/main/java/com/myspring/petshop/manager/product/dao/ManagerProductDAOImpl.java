package com.myspring.petshop.manager.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.product.vo.ProductVO;

@Repository
public class ManagerProductDAOImpl implements ManagerProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertProduct(Map<String, Object> map) throws Exception {
		sqlSession.insert("mapper.managerProduct.insertProduct", map);
	}
	
	@Override
	public List<ProductVO> selectProducts(Pagination pagination) throws Exception { 
		
		return sqlSession.selectList("mapper.managerProduct.selectProducts", pagination);
	}
	
	@Override
	public List<ProductVO> selectFewStockProducts(Pagination pagination) throws Exception { 
		
		return sqlSession.selectList("mapper.managerProduct.selectFewStockProducts", pagination);
	}
	
	@Override
	public int selectProductsCnt() throws Exception {
		
		return sqlSession.selectOne("mapper.managerProduct.selectProductsCnt");
	}
	
	@Override
	public ProductVO selectProduct(String p_code) throws Exception {
		
		return sqlSession.selectOne("mapper.managerProduct.selectProduct", p_code);
	}
	
	
	@Override
	public void updateProduct(Map<String, Object> map) throws Exception {
		sqlSession.update("mapper.managerProduct.updateProduct", map);
	}
	
	@Override
	public void deleteProduct(String p_code) throws Exception {
		sqlSession.delete("mapper.managerProduct.deleteProduct", p_code);
	}
	
	@Override
	public int selectSearchProductsCnt(Map searchMap) throws Exception {
		
		return sqlSession.selectOne("mapper.managerProduct.selectSearchProductsCnt", searchMap);
	}
	
	@Override
	public List selectSearchProducts(Map searchMap) throws Exception {
		
		return sqlSession.selectList("mapper.managerProduct.selectSearchProducts", searchMap);
	}
}