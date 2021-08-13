package com.myspring.petshop.manager.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.review.service.ManagerReviewService;
import com.myspring.petshop.manager.review.vo.ManagerReviewVO;
import com.myspring.petshop.member.vo.MemberVO;

@Controller
public class ManagerReviewControllerImpl implements ManagerReviewController {
	@Autowired
	private ManagerReviewService managerReviewService;
	@Autowired
	private MemberVO memberVO;
	
	
	@Override
	@RequestMapping(value="/manager/getReviewList.do", method = RequestMethod.GET)
	public ModelAndView getReviewList(@RequestParam(required = false, defaultValue = "1") int page,
									  @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		ModelAndView mav = new ModelAndView("managerReview");
		
		int listCnt = managerReviewService.getReviewsCnt();
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		List<ManagerReviewVO> reviewList = managerReviewService.getReviewList(pagination);
		
		mav.addObject("reviewList", reviewList);
		mav.addObject("pagination", pagination);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/reviewPass.do", method = RequestMethod.POST)
	public ResponseEntity reviewPass(@RequestParam("p_code") String p_code, HttpServletRequest request,
								   @RequestParam("member_nick") String member_nick, HttpSession session) throws Exception {
		
		int member_num = managerReviewService.getMember_num(member_nick);
		
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		reviewMap.put("member_nick", member_nick);
		reviewMap.put("p_code", p_code);
		reviewMap.put("member_num", member_num);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			managerReviewService.reviewPass(reviewMap);
			message = "<script>";
			message += "alert('포인트 지급 및 후기 검수 합격 완료');";
			message += "location.href='" + request.getContextPath() + "/manager/getReviewList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류 발생. 다시 시도해주세요.');";
			message += "location.href='" + request.getContextPath() + "/manager/getReviewList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value="/manager/reviewFail.do", method = RequestMethod.POST)
	public ResponseEntity reviewFail(@RequestParam("review_num") int review_num, HttpServletRequest request) throws Exception {
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			managerReviewService.reviewFail(review_num);
			message = "<script>";
			message += "alert('후기 검수 불합격 처리 완료');";
			message += "location.href='" + request.getContextPath() + "/manager/getReviewList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류 발생. 다시 시도해주세요.');";
			message += "location.href='" + request.getContextPath() + "/manager/getReviewList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value="/manager/reviewRemove.do", method = RequestMethod.POST)
	public ResponseEntity reviewRemove(@RequestParam("review_num") int review_num, HttpServletRequest request) throws Exception {
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			managerReviewService.reviewRemove(review_num);
			message = "<script>";
			message += "alert('후기 삭제 완료');";
			message += "location.href='" + request.getContextPath() + "/manager/getReviewList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류 발생. 다시 시도해주세요.');";
			message += "location.href='" + request.getContextPath() + "/manager/getReviewList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	
}
