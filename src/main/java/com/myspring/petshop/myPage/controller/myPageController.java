package com.myspring.petshop.myPage.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class myPageController {
	
	@RequestMapping(value = "/order.do", method = RequestMethod.GET)
	public String order(Locale locale, Model model) {
	
		
		return "order";
	}
	
	@RequestMapping(value = "/love.do", method = RequestMethod.GET)
	public String love(Locale locale, Model model) {
	
		
		return "love";
	}
	
	@RequestMapping(value = "/infoCertify.do", method = RequestMethod.GET)
	public String infoCertify(Locale locale, Model model) {
	
		
		return "infoCertify";
	}
	
	@RequestMapping(value = "/pwCertify.do", method = RequestMethod.GET)
	public String pwCertify(Locale locale, Model model) {
	
		
		return "pwCertify";
	}
	
	@RequestMapping(value = "/newPW.do", method = RequestMethod.GET)
	public String newPW(Locale locale, Model model) {
	
		
		return "newPW";
	}
	
	@RequestMapping(value = "/quit.do", method = RequestMethod.GET)
	public String quit(Locale locale, Model model) {
	
		
		return "quit";
	}
	
	@RequestMapping(value = "/address.do", method = RequestMethod.GET)
	public String address(Locale locale, Model model) {
	
		
		return "address";
	}
	
	@RequestMapping(value = "/addressWrite.do", method = RequestMethod.GET)
	public String addressWrite(Locale locale, Model model) {
	
		
		return "addressWrite";
	}
	
	@RequestMapping(value = "/infoModify.do", method = RequestMethod.GET)
	public String infoModify(Locale locale, Model model) {
	
		
		return "infoModify";
	}
	
	@RequestMapping(value = "/orderCancle.do", method = RequestMethod.GET)
	public String orderCancle(Locale locale, Model model) {
	
		
		return "orderCancle";
	}
	
	
}
