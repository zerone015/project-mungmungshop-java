package com.myspring.petshop.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.review.vo.ReviewVO;

public interface ReviewDAO {

	public int selectReviewCnt(String p_code) throws DataAccessException;
	public int selectReviewCnt2(Map<String, Object> map) throws DataAccessException;
	public List selectAllReviewList(Map<String, Object> info) throws DataAccessException;

	public int selectMyReviewCnt() throws DataAccessException;

	public List selectMyReviewList(Map<String, Object> info) throws DataAccessException;

	public int reviewWrite(Map<String, Object> map) throws DataAccessException;
	
	public int oneReview(String p_code) throws DataAccessException;
	public int twoReview(String p_code) throws DataAccessException;
	public int threeReview(String p_code) throws DataAccessException;
	public int fourReview(String p_code) throws DataAccessException;
	public int fiveReview(String p_code) throws DataAccessException;

	public ReviewVO getReview(int review_num)throws DataAccessException;

	public int reviewMod(Map<String, Object> map) throws DataAccessException;
	public void deleteReview(int review_num) throws DataAccessException;
}
