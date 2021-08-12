package com.myspring.petshop.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.review.dao.ReviewDAO;
import com.myspring.petshop.review.vo.ReviewVO;


@Service("reviewService")
@Transactional(propagation = Propagation.REQUIRED)
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public int reviewCnt(String p_code) throws DataAccessException {
		return reviewDAO.selectReviewCnt(p_code);
	}

	@Override
	public List listReview(Map<String, Object> info) throws DataAccessException {
	
		List reviewList = null;
		reviewList = reviewDAO.selectAllReviewList(info);
		return reviewList;
	}

	@Override
	public int myReviewCnt() throws DataAccessException {
		return reviewDAO.selectMyReviewCnt();
	}
	
	@Override
	public int getReviewCnt(Map<String, Object> map) throws DataAccessException {
		return reviewDAO.selectReviewCnt2(map);
	}

	@Override
	public List listMyReview(Map<String, Object> info) throws DataAccessException {
		List reviewList = null;
		reviewList = reviewDAO.selectMyReviewList(info);
		return reviewList;
	}
	
	@Override
	public int reviewWrite(Map<String, Object> map) throws DataAccessException {
		return reviewDAO.reviewWrite(map);
	}
	
	@Override
	public int oneReview(String p_code) throws DataAccessException {
		return reviewDAO.oneReview(p_code);
	}
	@Override
	public int twoReview(String p_code) throws DataAccessException {
		return reviewDAO.twoReview(p_code);
	}
	@Override
	public int threeReview(String p_code) throws DataAccessException {
		return reviewDAO.threeReview(p_code);
	}
	@Override
	public int fourReview(String p_code) throws DataAccessException {
		return reviewDAO.fourReview(p_code);
	}
	@Override
	public int fiveReview(String p_code) throws DataAccessException {
		return reviewDAO.fiveReview(p_code);
	}

	@Override
	public ReviewVO getReview(int review_num) throws DataAccessException {
		return reviewDAO.getReview(review_num);
	}

	@Override
	public int reviewMod(Map<String, Object> map) throws DataAccessException {
		return reviewDAO.reviewMod(map);
	}
}
