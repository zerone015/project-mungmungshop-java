package com.myspring.petshop.manager.order.controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ManagerOrderController {
	public ModelAndView getOrderList(@RequestParam(required = false, defaultValue = "1") int page,
			 @RequestParam(required = false, defaultValue = "1") int range) throws Exception;
}
