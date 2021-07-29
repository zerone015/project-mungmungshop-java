package com.myspring.petshop.myPage.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.myPage.order.service.OrderService;
import com.myspring.petshop.payment.vo.CombineVO;


@Controller
@EnableAspectJAutoProxy
public class OrderControllerImpl implements OrderController {
	@Autowired
	private OrderService orderService;
	
	@Override
	@RequestMapping(value = "/myPage/getOrderList.do", method = RequestMethod.GET)
	public ModelAndView getOrderList(HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int member_num = memberVO.getMember_num();
		
		int listCnt = orderService.getOrderCnt(member_num);
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		Map<String, Object> orderMap = new HashMap<String, Object>();
		orderMap.put("member_num", member_num);
		orderMap.put("pagination", pagination);
		
		List<CombineVO> orderList = orderService.getOrderList(orderMap);
		
		ModelAndView mav = new ModelAndView("order");
		mav.addObject("orderList", orderList);
		mav.addObject("pagination", pagination);
	
		return mav;
	}

}
