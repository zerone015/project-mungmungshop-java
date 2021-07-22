package com.myspring.petshop.review.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.Pagination;

public interface ReviewService {
	
	public List listReview(Pagination pagination, String p_code) throws DataAccessException;

	public int reviewCnt() throws DataAccessException;
}
