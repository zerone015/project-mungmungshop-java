package com.myspring.petshop.payment.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PaymentController {
	@RequestMapping(value = "/paymentResult.do", method = RequestMethod.GET)
	public String homeeeee(Locale locale, Model model) {
		
		return "paymentResult";
	}
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String payment(Locale locale, Model model) {
		
		return "payment";
	}
}
