package com.myspring.petshop.manager.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import com.myspring.petshop.manager.order.service.ManagerOrderService;
import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;
import com.myspring.petshop.payment.service.PaymentService;
import com.myspring.petshop.payment.vo.CombineVO;

@Controller
public class ManagerOrderControllerImpl implements ManagerOrderController {
	@Autowired
	private ManagerOrderService managerService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private PaymentService paymentService;

	@Override
	@RequestMapping(value="/manager/getOrderList.do", method = RequestMethod.GET)
	public ModelAndView getOrderList(@RequestParam(required = false, defaultValue = "1") int page,
									 @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		int listCnt = managerService.getOrdersCnt();
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		List<CombineVO> orderList = managerService.getOrderList(pagination);
		
		ModelAndView mav = new ModelAndView("managerOrderList");
		mav.addObject("orderList", orderList);
		mav.addObject("pagination", pagination);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/getOrderInfo.do", method = RequestMethod.GET)
	public ModelAndView getOrderInfo(@RequestParam("order_code") String order_code) throws Exception {
		Map<String, Object> orderMap = managerService.getOrderInfo(order_code);
		
		ModelAndView mav = new ModelAndView("managerOrderInfo");
		mav.addObject("orderMap", orderMap);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/getRefundList.do", method = RequestMethod.GET)
	public ModelAndView getRefundList(@RequestParam(required = false, defaultValue = "1") int page,
									 @RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		int listCnt = managerService.getRefundsCnt();
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		List<CombineVO> refundList = managerService.getRefundList(pagination);
		
		ModelAndView mav = new ModelAndView("managerRefundList");
		mav.addObject("refundList", refundList);
		mav.addObject("pagination", pagination);
		
		return mav;
	}

	
	@Override
	@RequestMapping(value = "/manager/modOrderStatus.do", method = RequestMethod.POST)
	public ResponseEntity modOrderStatus(@ModelAttribute("odv") OrderDetailVO odv, HttpServletRequest request) throws Exception {
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		String order_code = odv.getOrder_code();
		try {
			managerService.modOrderStatus(odv);
			message = "<script>";
			message += "alert('주문 상태를 수정하였습니다.');";
			message += "location.href='" + request.getContextPath() + "/manager/getOrderInfo.do?order_code=" + order_code + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해주세요');";
			message += "location.href='" + request.getContextPath() + "/manager/getOrderInfo.do?order_code=" + order_code + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/manager/getSearchOrders.do", method = RequestMethod.GET)
	public ModelAndView getSearchOrders(@RequestParam("searchBy") String searchBy, @RequestParam("searchContents") String searchContents,
										@RequestParam(required = false, defaultValue = "1") int page,
										@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchBy", searchBy);
		searchMap.put("searchContents", searchContents);
		
		int	listCnt = managerService.searchOrdersCnt(searchMap);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		searchMap.put("pagination", pagination);
		
		List<CombineVO> orderList = managerService.getSearchOrders(searchMap);
		
		ModelAndView mav = new ModelAndView("managerOrderList");
		mav.addObject("orderList", orderList);
		mav.addObject("pagination", pagination);
		mav.addObject("searchBy", searchBy);
		mav.addObject("searchContents", searchContents);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/manager/getSearchRefunds.do", method = RequestMethod.GET)
	public ModelAndView getSearchRefunds(@RequestParam("searchBy") String searchBy, @RequestParam("searchContents") String searchContents,
										@RequestParam(required = false, defaultValue = "1") int page,
										@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchBy", searchBy);
		searchMap.put("searchContents", searchContents);
		
		int	listCnt = managerService.searchRefundsCnt(searchMap);
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		searchMap.put("pagination", pagination);
		
		List<CombineVO> refundList = managerService.getSearchRefunds(searchMap);
		
		ModelAndView mav = new ModelAndView("managerRefundList");
		mav.addObject("refundList", refundList);
		mav.addObject("pagination", pagination);
		mav.addObject("searchBy", searchBy);
		mav.addObject("searchContents", searchContents);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/manager/modRefundStatus.do", method = RequestMethod.POST)
	public ResponseEntity modRefundStatus(@ModelAttribute("orderRefund") OrderRefundVO orderRefund, HttpServletRequest request, HttpSession session) throws Exception {
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try{
			managerService.modRefundStatus(orderRefund);
			
			int member_num = orderRefund.getMember_num();
			memberVO = paymentService.getMember(member_num);
			session.removeAttribute("member");
			session.setAttribute("member", memberVO);	
			
			message = "<script>";
			message += "alert('환불 처리가 완료되었습니다.');";
			message += "location.href='" + request.getContextPath() + "/manager/getRefundList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('에러가 발생했습니다.');";
			message += "location.href='" + request.getContextPath() + "/manager/getRefundList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
}
