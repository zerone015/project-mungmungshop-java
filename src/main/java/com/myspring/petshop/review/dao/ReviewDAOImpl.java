package com.myspring.petshop.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.Pagination;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectReviewCnt() throws DataAccessException {
		return sqlSession.selectOne("mapper.review.selectReviewCnt");
	}

	@Override
	public List selectAllReviewList(Map<String, Object> info) throws DataAccessException {
		return sqlSession.selectList("mapper.review.selectAllReviewList", info);
	}

	

}
