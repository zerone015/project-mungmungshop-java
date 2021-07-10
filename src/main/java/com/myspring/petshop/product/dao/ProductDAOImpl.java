package com.myspring.petshop.product.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.product.vo.ProductVO;


@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectProducts(HashMap productInfo) throws Exception {
		
		return sqlSession.selectList("mapper.product.selectProducts", productInfo);
	}
	
	@Override
	public int selectProductsCnt(ProductVO category) throws Exception {
		
		return sqlSession.selectOne("mapper.product.selectProductsCnt", category);
	}
	
	@Override
	public List selectLoveRanking(HashMap productInfo) throws Exception {
		
		return sqlSession.selectList("mapper.product.selectLoveRanking", productInfo);
	}
	
	@Override
	public List selectNewRanking(HashMap productInfo) throws Exception {
		
		return sqlSession.selectList("mapper.product.selectNewRanking", productInfo);
	}
	
	@Override
	public List selectLowPriceRanking(HashMap productInfo) throws Exception {
		
		return sqlSession.selectList("mapper.product.selectLowPriceRanking", productInfo);
	}
	
	@Override
	public List selectHighPriceRanking(HashMap productInfo) throws Exception {
		
		return sqlSession.selectList("mapper.product.selectHighPriceRanking", productInfo);
	}
	
	@Override
	public List selectAllProducts(HashMap productInfo) throws Exception {
		
		return sqlSession.selectList("mapper.product.selectAllProducts", productInfo);
	}
	
}
