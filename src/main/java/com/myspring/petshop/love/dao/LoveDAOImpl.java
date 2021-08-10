package com.myspring.petshop.love.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.love.vo.LoveVO;
import com.myspring.petshop.product.vo.ProductVO;

@Repository
public class LoveDAOImpl implements LoveDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectLoveCnt(LoveVO love) throws DataAccessException{
		return sqlSession.selectOne("mapper.love.selectLoveCnt", love);
	}
	
	@Override
	public void insertLove(LoveVO love) throws DataAccessException{
		sqlSession.insert("mapper.love.insertLove", love);
	}
	
	@Override
	public void deleteLove(LoveVO love) throws DataAccessException{
		sqlSession.delete("mapper.love.deleteLove", love);
	}
	
	@Override
	public int selectProductLove(String p_code) throws DataAccessException{
		return sqlSession.selectOne("mapper.love.selectProductLove", p_code);
	}
	
	@Override
	public int selectMaxLoveNum() throws DataAccessException {
		
		return sqlSession.selectOne("mapper.love.selectMaxLoveNum"); 
	}
	
	@Override
	public int selectLoveListCnt(int member_num) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.love.selectLoveListCnt", member_num); 
	}
	
	@Override
	public List<ProductVO> selectLoveList(Map<String, Object> loveMap) throws DataAccessException {
		
		return sqlSession.selectList("mapper.love.selectLoveList", loveMap); 
	}
}