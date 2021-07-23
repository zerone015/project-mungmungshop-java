package com.myspring.petshop.payment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.petshop.payment.vo.PaymentVO;

public interface PaymentController {
	public String getPaymentCompletePage(Model model) throws Exception;
	public String getPaymentPage(@ModelAttribute("payment") PaymentVO payment,
			HttpServletRequest request, Model model) throws Exception;
}
