package com.myspring.petshop.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.review.vo.ReviewVO;

public interface ReviewService {
	
	public List listReview(Map<String, Object> info) throws DataAccessException;

	public int reviewCnt() throws DataAccessException;
}
