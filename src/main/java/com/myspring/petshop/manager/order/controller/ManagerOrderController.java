package com.myspring.petshop.manager.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.manager.order.vo.OrderDetailVO;

public interface ManagerOrderController {
	public ModelAndView getOrderList(@RequestParam(required = false, defaultValue = "1") int page,
			 @RequestParam(required = false, defaultValue = "1") int range) throws Exception;
	public ModelAndView getOrderInfo(@RequestParam("order_code") String order_code) throws Exception;
	public ResponseEntity modOrderStatus(@ModelAttribute("odv") OrderDetailVO odv, HttpServletRequest request) throws Exception;
	public ModelAndView getSearchOrders(@RequestParam("searchBy") String searchBy, @RequestParam("searchContents") String searchContents,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception;
}
