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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.payment.service.PaymentService;
import com.myspring.petshop.payment.vo.PaymentPrdVO;
import com.myspring.petshop.payment.vo.PaymentVO;

@Controller
public class PaymentControllerImpl implements PaymentController {
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private PaymentService paymentService;	
	@Autowired
	private PaymentVO paymentVO;
	@Autowired
	private PaymentPrdVO paymentPrdVO;
	
	
	@Override
	@RequestMapping(value = "/payment/getPaymentCompletePage.do", method = RequestMethod.GET)
	public String getPaymentCompletePage(Model model) throws Exception {
		
		return "PaymentCompletePage";
	}
	
	@Override
	@RequestMapping(value = "/payment/getPaymentPage.do", method = RequestMethod.GET)
	public String getPaymentPage(@ModelAttribute("payment") PaymentVO payment,
			HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		int member_num = memberVO.getMember_num();
		
		paymentVO = paymentService.getAddress(member_num);
		
		String[] p_codes = request.getParameterValues("productCheck");
		
		if(p_codes != null) {
			List<PaymentPrdVO> orderPrdList = new ArrayList<PaymentPrdVO>();
			for(int i=0; i<p_codes.length; i++) {
				Map<String, Object> orderMap = new HashMap<String, Object>();
				orderMap.put("member_num", member_num);
				orderMap.put("p_code", p_codes[i]);
				int cart_quantity = paymentService.getCartChkQuantity(orderMap);
				paymentPrdVO = paymentService.getCartChkProducts(p_codes[i]);
				paymentPrdVO.setCart_quantity(cart_quantity);
				orderPrdList.add(paymentPrdVO);
			}
			model.addAttribute("orderPrdList", orderPrdList);
		}
		else {
			String p_code = payment.getP_code();
			int order_quantity = payment.getOrder_quantity();
			paymentPrdVO = paymentService.getCartChkProducts(p_code);
			paymentPrdVO.setOrder_quantity(order_quantity);
			
			model.addAttribute("paymentPrdVO", paymentPrdVO);
		}
		
		if(paymentVO != null) {
			model.addAttribute("paymentVO", paymentVO);
		}

		return "PaymentPage";
	}
}
