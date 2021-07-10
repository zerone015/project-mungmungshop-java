package com.myspring.petshop;

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

@RequestMapping(value = "/eventList.do", method = RequestMethod.GET)
public String eventList(Locale locale, Model model) {
	
	return "eventList";
}

@RequestMapping(value = "/eventWrite.do", method = RequestMethod.GET)
public String eventWrite(Locale locale, Model model) {
	
	return "eventWrite";
}

@RequestMapping(value = "/faqList.do", method = RequestMethod.GET)
public String faqList(Locale locale, Model model) {
	
	return "faqList";
}

@RequestMapping(value = "/faqWrite.do", method = RequestMethod.GET)
public String faqWrite(Locale locale, Model model) {
	
	return "faqWrite";
}

@RequestMapping(value = "/qnaList.do", method = RequestMethod.GET)
public String qnaList(Locale locale, Model model) {
	
	return "qnaList";
}

@RequestMapping(value = "/qnaWrite.do", method = RequestMethod.GET)
public String qnaWrite(Locale locale, Model model) {
	
	return "qnaWrite";
}

@RequestMapping(value = "/qnaArticle.do", method = RequestMethod.GET)
public String qnaArticle(Locale locale, Model model) {
	
	return "qnaArticle";
}

}