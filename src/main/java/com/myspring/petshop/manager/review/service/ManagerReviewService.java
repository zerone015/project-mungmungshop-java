package com.myspring.petshop.manager.review.service;

import java.util.List;
import java.util.Map;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.review.vo.ManagerReviewVO;

public interface ManagerReviewService {
	public int getReviewsCnt() throws Exception;
	public List<ManagerReviewVO> getReviewList(Pagination pagination) throws Exception;
	public int getMember_num(String member_nick) throws Exception;
	public void reviewPass(Map<String, Object> reviewMap) throws Exception;
	public void reviewFail(int review_num) throws Exception;
	public void reviewRemove(int review_num) throws Exception;
}
