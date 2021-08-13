package com.myspring.petshop.manager.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.manager.review.vo.ManagerReviewVO;

public interface ManagerReviewController {
	public ModelAndView getReviewList(@RequestParam(required = false, defaultValue = "1") int page,
			  @RequestParam(required = false, defaultValue = "1") int range) throws Exception;
	
	public ResponseEntity reviewPass(@RequestParam("p_code") String p_code, HttpServletRequest request,
			   @RequestParam("member_nick") String member_nick, HttpSession session) throws Exception;
	
	public ResponseEntity reviewFail(@RequestParam("review_num") int review_num, HttpServletRequest request) throws Exception;
	public ResponseEntity reviewRemove(@RequestParam("review_num") int review_num, HttpServletRequest request) throws Exception;
}
