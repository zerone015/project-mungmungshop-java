package com.myspring.petshop.myPage.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.myPage.order.service.OrderService;
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;
import com.myspring.petshop.myPage.order.vo.PointHistoryVO;
import com.myspring.petshop.payment.service.PaymentService;
import com.myspring.petshop.payment.vo.CombineVO;
import com.myspring.petshop.product.vo.ProductVO;


@Controller
@EnableAspectJAutoProxy
public class OrderControllerImpl implements OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private CombineVO combineVO;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private PaymentService paymentService;
	
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
	
	
	@RequestMapping(value = "/myPage/getRefundPage.do", method = RequestMethod.POST)
	public ModelAndView getRefundPage(@RequestParam("order_detailCode") String order_detailCode, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		combineVO = orderService.getRefundInfo(order_detailCode);
		int order_usePoint = orderService.getOrder_usePoint(combineVO.getOrder_code()); 
		
		mav.setViewName("orderRefund");
		mav.addObject("combineVO", combineVO);
		mav.addObject("order_usePoint", order_usePoint);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/myPage/addOrderRefund.do", method = RequestMethod.POST)
	public ResponseEntity addOrderRefund(@ModelAttribute("orderRefund") OrderRefundVO orderRefund,Errors errors,
					HttpSession session, HttpServletRequest request) throws Exception {
			
		memberVO = (MemberVO) session.getAttribute("member");
		int member_num = memberVO.getMember_num();
		orderRefund.setMember_num(member_num);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String order_status = orderRefund.getOrder_status();
		try{
			orderService.addOrderRefund(orderRefund);
			message = "<script>";
			if(order_status.equals("결제완료") || order_status.equals("배송준비중")) {
				message += "alert('주문 취소 및 환불이 완료되었습니다.');";
				memberVO = paymentService.getMember(member_num);
				session.removeAttribute("member");
				session.setAttribute("member", memberVO);	
			}
			else {
				message += "alert('환불 요청 완료');";
			}
			message += "location.href='" + request.getContextPath() + "/myPage/getOrderList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('에러가 발생했습니다.');";
			message += "location.href='" + request.getContextPath() + "/myPage/getOrderList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
			
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/myPage/getPointHistory.do", method = RequestMethod.GET)
	public ModelAndView getPointHistory(@RequestParam(required = false, defaultValue = "1") int page,
									    @RequestParam(required = false, defaultValue = "1") int range,HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		memberVO = (MemberVO) session.getAttribute("member");
		int member_num = memberVO.getMember_num();
		
		int listCnt = orderService.getPointHistoryCnt(member_num);
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		Map<String, Object> phMap = new HashMap<String, Object>();
		phMap.put("member_num", member_num);
		phMap.put("pagination", pagination);
		
		List<PointHistoryVO> phList = orderService.getPointHistory(phMap);
		
		
		mav.setViewName("pointHistory");
		mav.addObject("phList", phList);
		mav.addObject("pagination", pagination);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/myPage/buyConfirm.do", method = RequestMethod.POST)
	public ResponseEntity buyConfirm(@ModelAttribute("odv") OrderDetailVO odv, HttpSession session, HttpServletRequest request) throws Exception {
		memberVO = (MemberVO) session.getAttribute("member");
		int member_num = memberVO.getMember_num();
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try{
			orderService.buyConfirm(odv, member_num);
			message = "<script>";
			message += "alert('구매 확정을 완료하였습니다.');";
			memberVO = paymentService.getMember(member_num);
			session.removeAttribute("member");
			session.setAttribute("member", memberVO);	
			message += "location.href='" + request.getContextPath() + "/myPage/getOrderList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('에러가 발생했습니다.');";
			message += "location.href='" + request.getContextPath() + "/myPage/getOrderList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/myPage/quickProducts.do", method = RequestMethod.GET)
	public ModelAndView quickProducts(@RequestParam(required = false, defaultValue = "1") int page,
									  @RequestParam(required = false, defaultValue = "1") int range, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView("quickProducts");
		List<ProductVO> quickProductsList;
		HttpSession session = request.getSession();
		quickProductsList=(ArrayList<ProductVO>)session.getAttribute("quickProductsList");
		
		int listCnt = 0;
		if(quickProductsList != null) {
			listCnt = quickProductsList.size();
		}
		
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		mav.addObject("quickClick", true);
		mav.addObject("pagination", pagination);
		
		return mav;
	}
}
