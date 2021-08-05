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
	public int reviewCnt() throws DataAccessException {
		return reviewDAO.selectReviewCnt();
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
	public List listMyReview(Map<String, Object> info) throws DataAccessException {
		List reviewList = null;
		reviewList = reviewDAO.selectMyReviewList(info);
		return reviewList;
	}
	
	@Override
	public int reviewWrite(Map<String, Object> map) throws DataAccessException {
		return reviewDAO.reviewWrite(map);
	}

}
