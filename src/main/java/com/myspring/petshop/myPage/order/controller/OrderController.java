package com.myspring.petshop.myPage.order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;

public interface OrderController {
	public ModelAndView getOrderList(HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception;
	public ModelAndView getRefundPage(@RequestParam("order_detailCode") String order_detailCode, HttpServletRequest request) throws Exception;
	public ResponseEntity addOrderRefund(@ModelAttribute("orderRefund") OrderRefundVO orderRefund,Errors errors,
			HttpSession session, HttpServletRequest request) throws Exception;
	public ModelAndView getPointHistory(@RequestParam(required = false, defaultValue = "1") int page,
		    @RequestParam(required = false, defaultValue = "1") int range,HttpSession session) throws Exception;
	public ResponseEntity buyConfirm(@ModelAttribute("odv") OrderDetailVO odv, HttpSession session, HttpServletRequest request) throws Exception;
}
