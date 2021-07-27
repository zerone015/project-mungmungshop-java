package com.myspring.petshop.payment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.myPage.address.vo.AddressVO;
import com.myspring.petshop.payment.service.PaymentService;
import com.myspring.petshop.payment.vo.CombineVO;
import com.myspring.petshop.payment.vo.OrderDetailVO;
import com.myspring.petshop.payment.vo.OrderVO;
import com.myspring.petshop.payment.vo.PaymentVO;

@Controller
public class PaymentControllerImpl implements PaymentController {
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private PaymentService paymentService;	
	@Autowired
	private AddressVO addressVO;
	@Autowired
	private PaymentVO paymentVO;
	@Autowired
	private OrderVO orderVO;
	@Autowired
	private OrderDetailVO orderDetailVO;
	
	
	
	@Override
	@RequestMapping(value = "/payment/getPaymentCompletePage.do", method = RequestMethod.GET)
	public String getPaymentCompletePage(Model model) throws Exception {
		
		return "PaymentCompletePage";
	}
	
	@Override
	@RequestMapping(value = "/payment/getPaymentPage.do", method = RequestMethod.GET)
	public String getPaymentPage(@ModelAttribute("paymentVO") PaymentVO paymentVO,
			HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		int member_num = memberVO.getMember_num();
		
		addressVO = paymentService.getAddress(member_num); 
		
		String[] p_codes = request.getParameterValues("productCheck");
		
		List<PaymentVO> paymentPrdList = new ArrayList<PaymentVO>();
		String p_name;
		if(p_codes != null) {
			for(int i=0; i<p_codes.length; i++) {
				Map<String, Object> orderMap = new HashMap<String, Object>();
				orderMap.put("member_num", member_num);
				orderMap.put("p_code", p_codes[i]);
				int cart_quantity = paymentService.getCartChkQuantity(orderMap);
				paymentVO = paymentService.getCartChkProducts(p_codes[i]);
				paymentVO.setCart_quantity(cart_quantity);
				paymentPrdList.add(paymentVO);
			}
			p_name = paymentVO.getP_name();
			
			model.addAttribute("paymentPrdList", paymentPrdList);
			
		}
		else {
			String p_code = paymentVO.getP_code();
			int order_quantity = paymentVO.getOrder_quantity();
			paymentVO = paymentService.getCartChkProducts(p_code);
			paymentVO.setOrder_quantity(order_quantity);
			p_name = paymentVO.getP_name();
			
			model.addAttribute("paymentVO", paymentVO);
		}
		
		if(addressVO != null) {
			model.addAttribute("addressVO", addressVO);
		}
		
		model.addAttribute("memberVO", memberVO);
		model.addAttribute("p_name", p_name);
		
		return "PaymentPage";
	}
	
	@Override
	@RequestMapping(value="/payment/addPayment.do", method = RequestMethod.POST)
	public ModelAndView addPayment(@ModelAttribute("combineVO") CombineVO combineVO, Errors errors,
			HttpServletRequest request) throws Exception {
		
		String[] p_codes = request.getParameterValues("p_code");
		String[] order_quantitys = request.getParameterValues("order_quantity");
		String[] p_prices = request.getParameterValues("p_price");
		String[] order_prices = request.getParameterValues("order_price");
		
		Map<String, Object> paymentMap = new HashMap<String, Object>();
		paymentMap.put("p_codes", p_codes);
		paymentMap.put("order_quantitys", order_quantitys);
		paymentMap.put("p_prices", p_prices);
		paymentMap.put("order_prices", order_prices);
	
		if(p_codes.length > 1) {
			paymentService.addPayments(paymentMap,combineVO);
		}
		
		else {
			paymentService.addPayment(combineVO);
		}

		
		ModelAndView mav = new ModelAndView("paymentResult");
		
		return mav;
	}
}
