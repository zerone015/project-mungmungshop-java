package com.myspring.petshop.board;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping(value = "/noticeList.do", method = RequestMethod.GET)
	public String noticeList(Locale locale, Model model) {
		
		return "noticeList";
	}
	
	
	
	
	@RequestMapping(value = "/noticeWrite.do", method = RequestMethod.GET)
	public String noticeWrite(Locale locale, Model model) {
		
		return "noticeWrite";
	}


}