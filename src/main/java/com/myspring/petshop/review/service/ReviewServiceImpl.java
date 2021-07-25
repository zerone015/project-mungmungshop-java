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
	public List listReview(Pagination pagination, String p_code) throws DataAccessException {
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("pagination", pagination);
		info.put("p_code", p_code);
		
		List reviewList = null;
		reviewList = reviewDAO.selectAllReviewList(info);
		return reviewList;
	}

}