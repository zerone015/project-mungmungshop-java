package com.myspring.petshop.review.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.review.vo.ReviewVO;

@Repository("reviewDAO")
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectReviewCnt(String p_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.selectReviewCnt", p_code);
	}

	@Override
	public List selectAllReviewList(Map<String, Object> info) throws DataAccessException {
		return sqlSession.selectList("mapper.review.selectAllReviewList", info);
	}

	@Override
	public int selectMyReviewCnt() throws DataAccessException {
		return sqlSession.selectOne("mapper.review.selectMyReviewCnt");
	}
	
	@Override
	public int selectReviewCnt2(Map<String, Object> map) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.selectReviewCnt2", map);
	}

	@Override
	public List selectMyReviewList(Map<String, Object> info) throws DataAccessException {
		return sqlSession.selectList("mapper.review.selectMyReviewList", info);
	}
	
	@Override
	public int reviewWrite(Map<String, Object> map) throws DataAccessException {
		return sqlSession.insert("mapper.review.reviewInsert", map);
	}
	
	@Override
	public int oneReview(String p_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.oneReview", p_code);
	}
	@Override
	public int twoReview(String p_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.twoReview", p_code);
	}
	@Override
	public int threeReview(String p_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.threeReview", p_code);
	}
	@Override
	public int fourReview(String p_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.fourReview", p_code);
	}
	@Override
	public int fiveReview(String p_code) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.fiveReview", p_code);
	}

	@Override
	public ReviewVO getReview(int review_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.review.getReview", review_num);
	}

	@Override
	public int reviewMod(Map<String, Object> map) throws DataAccessException {
		return sqlSession.update("mapper.review.reviewMod", map);
	}
	
	@Override
	public void deleteReview(int review_num) throws DataAccessException {
		sqlSession.delete("mapper.review.deleteReview", review_num);
	}
}
