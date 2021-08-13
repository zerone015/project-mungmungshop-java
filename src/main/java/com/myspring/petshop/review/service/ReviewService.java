package com.myspring.petshop.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.review.vo.ReviewVO;

public interface ReviewService {
	
	public List listReview(Map<String, Object> info) throws DataAccessException;

	public int reviewCnt(String p_code) throws DataAccessException;

	public int myReviewCnt() throws DataAccessException;
	public int getReviewCnt(Map<String, Object> map) throws DataAccessException;
	public List listMyReview(Map<String, Object> info) throws DataAccessException;

	public int reviewWrite(Map<String, Object> map) throws DataAccessException;
	
	public int oneReview(String p_code) throws DataAccessException;
	public int twoReview(String p_code) throws DataAccessException;
	public int threeReview(String p_code) throws DataAccessException;
	public int fourReview(String p_code) throws DataAccessException;
	public int fiveReview(String p_code) throws DataAccessException;

	public ReviewVO getReview(int review_num) throws DataAccessException;

	public int reviewMod(Map<String, Object> map) throws DataAccessException;
	public void removeReview(int review_num) throws DataAccessException;
}
