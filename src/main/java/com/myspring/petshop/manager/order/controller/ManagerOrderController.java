package com.myspring.petshop.manager.order.controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.manager.order.vo.OrderDetailVO;

public interface ManagerOrderController {
	public ModelAndView getOrderList(@RequestParam(required = false, defaultValue = "1") int page,
			 @RequestParam(required = false, defaultValue = "1") int range) throws Exception;
	public ModelAndView getOrderInfo(@RequestParam("order_code") String order_code) throws Exception;
	public String modOrderStatus(@ModelAttribute("odv") OrderDetailVO odv) throws Exception;
}
