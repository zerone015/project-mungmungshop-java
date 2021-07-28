package com.myspring.petshop.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.product.vo.ProductVO;

@Repository
public class MainDAOImpl implements MainDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ProductVO> selectNewProducts() throws DataAccessException {
		return sqlSession.selectList("mapper.main.selectNewProducts");
	}
	
	@Override
	public List<ProductVO> selectRankProducts() throws DataAccessException {
		return sqlSession.selectList("mapper.main.selectRankProducts");
	}
}