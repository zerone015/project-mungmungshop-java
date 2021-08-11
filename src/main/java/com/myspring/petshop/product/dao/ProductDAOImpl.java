package com.myspring.petshop.product.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.product.vo.ProductVO;


@Repository("productDAO")
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectProducts(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectProducts", productInfo);
	}
	
	@Override
	public List selectBrandProducts(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectBrandProducts", productInfo);
	}
	
	@Override
	public int selectProductsCnt(ProductVO category) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.product.selectProductsCnt", category);
	}
	
	@Override
	public int selectBrandProductsCnt(String brandName) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.product.selectBrandProductsCnt", brandName);
	}
	
	@Override
	public List selectLoveRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectLoveRanking", productInfo);
	}
	
	@Override
	public List selectBrandLoveRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectBrandLoveRanking", productInfo);
	}
	
	@Override
	public List selectNewRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectNewRanking", productInfo);
	}
	
	@Override
	public List selectBrandNewRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectBrandNewRanking", productInfo);
	}
	
	@Override
	public List selectLowPriceRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectLowPriceRanking", productInfo);
	}
	
	@Override
	public List selectBrandLowPriceRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectBrandLowPriceRanking", productInfo);
	}
	
	
	@Override
	public List selectHighPriceRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectHighPriceRanking", productInfo);
	}
	
	@Override
	public List selectBrandHighPriceRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectBrandHighPriceRanking", productInfo);
	}
	
	@Override
	public List selectAllProducts(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectAllProducts", productInfo);
	}
	
	@Override
	public ProductVO selectProduct(String p_code) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.product.selectProduct", p_code);
	}
	
	
	@Override
	public List selectAllNewProducts(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectAllNewProducts", productInfo);
	}
	

	@Override
	public List selectNewLowPriceRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectNewLowPriceRanking", productInfo);
	}
	

	@Override
	public List selectNewHighPriceRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectNewHighPriceRanking", productInfo);
	}
	
	@Override
	public List selectNewLoveRanking(HashMap productInfo) throws DataAccessException {
		
		return sqlSession.selectList("mapper.product.selectNewLoveRanking", productInfo);
	}
	
	@Override
	public int selectNewProductsCnt() throws DataAccessException {
		
		return sqlSession.selectOne("mapper.product.selectNewProductsCnt");
	}
	
	@Override
	public int selectSearchProductsCnt(String searchWord) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.product.selectSearchProductsCnt", searchWord);
	}
	
	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
	   
	   return sqlSession.selectList("mapper.product.selectKeywordSearch", keyword);
	}
	
	@Override
	public List<ProductVO> selectSearchProducts(Map<String, Object> searchMap) throws DataAccessException {
	   
	   return sqlSession.selectList("mapper.product.selectSearchProducts", searchMap);
	}
	
}
