package com.myspring.petshop.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface ReviewDAO {

	public int selectReviewCnt() throws DataAccessException;

	public List selectAllReviewList(Map<String, Object> info) throws DataAccessException;
}
