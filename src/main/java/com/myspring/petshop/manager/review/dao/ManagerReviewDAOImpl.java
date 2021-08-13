package com.myspring.petshop.manager.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.review.vo.ManagerReviewVO;

@Repository
public class ManagerReviewDAOImpl implements ManagerReviewDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectReviewsCnt() throws DataAccessException{
		
		return sqlSession.selectOne("mapper.managerReview.selectReviewsCnt");
	}
	
	@Override
	public List<ManagerReviewVO> selectReviewList(Pagination pagination) throws DataAccessException{
		
		return sqlSession.selectList("mapper.managerReview.selectReviewList", pagination);
	}
	
	@Override
	public int selectMember_num(String member_nick) throws DataAccessException{
		
		return sqlSession.selectOne("mapper.managerReview.selectMember_num", member_nick);
	}
	
	@Override
	public void reviewPass(Map<String, Object> reviewMap) throws DataAccessException{
		
		sqlSession.insert("mapper.managerReview.reviewPass", reviewMap);
	}
	
	@Override
	public void reviewFail(int review_num) throws DataAccessException{
		
		sqlSession.update("mapper.managerReview.reviewFail", review_num);
	}
	
	@Override
	public void reviewRemove(int review_num) throws DataAccessException{
		
		sqlSession.delete("mapper.managerReview.reviewRemove", review_num);
	}
}
