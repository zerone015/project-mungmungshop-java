package com.myspring.petshop.myPage.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface OrderController {
	public ModelAndView getOrderList(HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception;
	public ModelAndView getRefundPage(@RequestParam("order_detailCode") String order_detailCode, HttpServletRequest request) throws Exception;
}
