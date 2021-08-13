package com.myspring.petshop.manager.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.review.dao.ManagerReviewDAO;
import com.myspring.petshop.manager.review.vo.ManagerReviewVO;

@Service
public class ManagerReviewServiceImpl implements ManagerReviewService {
	@Autowired
	private ManagerReviewDAO managerReviewDAO;

	@Override
	public int getReviewsCnt() throws Exception {
		
		return managerReviewDAO.selectReviewsCnt();
	}
	
	@Override
	public List<ManagerReviewVO> getReviewList(Pagination pagination) throws Exception {
		
		return managerReviewDAO.selectReviewList(pagination);
	}
	
	@Override
	public int getMember_num(String member_nick) throws Exception {
		
		return managerReviewDAO.selectMember_num(member_nick);
	}
	
	@Override
	public void reviewPass(Map<String, Object> reviewMap) throws Exception {
		managerReviewDAO.reviewPass(reviewMap);
	}
	
	@Override
	public void reviewFail(int review_num) throws Exception {
		managerReviewDAO.reviewFail(review_num);
	}
	
	@Override
	public void reviewRemove(int review_num) throws Exception {
		managerReviewDAO.reviewRemove(review_num);
	}
	
	
}