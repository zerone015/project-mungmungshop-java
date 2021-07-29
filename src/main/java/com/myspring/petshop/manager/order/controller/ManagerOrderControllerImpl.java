package com.myspring.petshop.manager.order.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.order.service.ManagerOrderService;
import com.myspring.petshop.payment.vo.CombineVO;

@Controller
public class ManagerOrderControllerImpl implements ManagerOrderController {
	@Autowired
	private ManagerOrderService managerService;

	@Override
	@RequestMapping(value="/manager/getOrderList.do", method = RequestMethod.GET)
	public ModelAndView getOrderList(@RequestParam(required = false, defaultValue = "1") int page,
									 @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		int listCnt = managerService.getOrdersCnt();
		
		System.out.println(listCnt);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		List<CombineVO> orderList = managerService.getOrderList(pagination);
		
		ModelAndView mav = new ModelAndView("managerOrderList");
		mav.addObject("orderList", orderList);
		mav.addObject("pagination", pagination);
		
		return mav;
	}
	
}
