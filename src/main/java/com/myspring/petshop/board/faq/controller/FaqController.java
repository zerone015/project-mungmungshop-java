package com.myspring.petshop.board.faq.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.board.faq.vo.FaqVO;

public interface FaqController {

	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView faqWrite(FaqVO faqVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView faqView(int faq_no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView faqModify(FaqVO faqVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView faqMod(int faq_no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView faqRemove(int faq_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
