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
	
	
	@RequestMapping(value = "/findId.do", method = RequestMethod.GET)
	public String findId(Model model) {
		
		
		return "findId";
	}
	
	@RequestMapping(value = "/findPw.do", method = RequestMethod.GET)
	public String findPw(Locale locale, Model model) {
		
		
		return "findPw";
	}
	
	@RequestMapping(value = "/resultId.do", method = RequestMethod.GET)
	public String resultId(Locale locale, Model model) {
		
		
		return "resultId";
	}
	
	@RequestMapping(value = "/joinMember.do", method = RequestMethod.POST)
	public String joinMember(Locale locale, Model model) {
		
		
		return "joinMember";
	}
	
	
	@RequestMapping(value = "/joinAgree.do", method = RequestMethod.GET)
	public String joinAgree(Locale locale, Model model) {
		
		
		return "joinAgree";
	}
	
	@RequestMapping(value = "/member/findPwCheck.do", method = RequestMethod.GET)
	public String findPwCheck(Locale locale, Model model) {
		
		
		return "findPwCheck";
	}
	
	@RequestMapping(value = "/changePwResult.do", method = RequestMethod.GET)
	public String findPwResult(Model model) {
		
		return "changePwResult";
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
	
	@RequestMapping(value = "/infoModify.do", method = RequestMethod.GET)
	public String infoModify(Locale locale, Model model) {


		return "infoModify";
	}

	@RequestMapping(value = "/orderCancle.do", method = RequestMethod.GET)
	public String orderCancle(Locale locale, Model model) {


		return "orderCancle";
	}

}
