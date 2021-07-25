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
import com.myspring.petshop.myPage.address.vo.AddressVO;
import com.myspring.petshop.payment.service.PaymentService;
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
			model.addAttribute("paymentPrdList", paymentPrdList);
		}
		else {
			String p_code = paymentVO.getP_code();
			int order_quantity = paymentVO.getOrder_quantity();
			paymentVO = paymentService.getCartChkProducts(p_code);
			paymentVO.setOrder_quantity(order_quantity);
			
			model.addAttribute("paymentVO", paymentVO);
		}
		
		if(addressVO != null) {
			model.addAttribute("addressVO", addressVO);
		}

		model.addAttribute("memberVO", memberVO);
		
		return "PaymentPage";
	}
}
