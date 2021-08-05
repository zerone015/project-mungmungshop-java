package com.myspring.petshop.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.review.vo.ReviewVO;

public interface ReviewDAO {

	public int selectReviewCnt() throws DataAccessException;

	public List selectAllReviewList(Map<String, Object> info) throws DataAccessException;

	public int selectMyReviewCnt() throws DataAccessException;

	public List selectMyReviewList(Map<String, Object> info) throws DataAccessException;

	public int reviewWrite(Map<String, Object> map) throws DataAccessException;
}
