package com.myspring.petshop.manager.review.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.review.vo.ManagerReviewVO;

public interface ManagerReviewDAO {
	public int selectReviewsCnt() throws DataAccessException;
	public List<ManagerReviewVO> selectReviewList(Pagination pagination) throws DataAccessException;
	public int selectMember_num(String member_nick) throws DataAccessException;
	public void reviewPass(Map<String, Object> reviewMap) throws DataAccessException;
	public void reviewFail(int review_num) throws DataAccessException;
	public void reviewRemove(int review_num) throws DataAccessException;
}
