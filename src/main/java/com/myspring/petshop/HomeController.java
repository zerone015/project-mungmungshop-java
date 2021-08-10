package com.myspring.petshop;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/joinWelcome.do", method = RequestMethod.GET)
	public String joinWelcome(Locale locale, Model model) {
		
		
		return "joinWelcome";
	}
	
	@RequestMapping(value = "/joinAgree.do", method = RequestMethod.GET)
	public String joinAgree(Locale locale, Model model) {
		
		
		return "joinAgree";
	}

	
	@RequestMapping(value = "/changePwResult.do", method = RequestMethod.GET)
	public String findPwResult(Model model) {
		
		return "changePwResult";
	}
	

	@RequestMapping(value = "/orderCancle.do", method = RequestMethod.GET)
	public String orderCancle(Locale locale, Model model) {


		return "orderCancle";
	}

}
