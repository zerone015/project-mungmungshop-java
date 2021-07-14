package com.myspring.petshop.board.faq.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.board.event.controller.EventController;
import com.myspring.petshop.board.event.controller.EventControllerImpl;
import com.myspring.petshop.board.event.service.EventService;
import com.myspring.petshop.board.event.vo.EventVO;
import com.myspring.petshop.board.faq.service.FaqService;
import com.myspring.petshop.board.faq.vo.FaqVO;

@Controller("faqController")
@EnableAspectJAutoProxy
public class FaqControllerImpl implements FaqController {
	@Autowired
	private FaqService faqService;

	private static final Logger logger = LoggerFactory.getLogger(EventControllerImpl.class);
	
	@Override
	@RequestMapping(value = "/board/faqList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView faqList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List faqList=faqService.listFaq();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("faqList", faqList);
		return mav;
	}
	
	@RequestMapping(value = "/board/faqWrite.do", method = RequestMethod.GET)
	public String faqWrite(Locale locale, Model model) {
		
		return "/board/faqWrite";
	}
	
	@Override
	@RequestMapping(value="/faqWrite.do", method=RequestMethod.POST)
	public ModelAndView faqWrite(@ModelAttribute("faq")FaqVO faqVO, HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		request.setCharacterEncoding("utf-8");
		int result=0;
		result = faqService.faqWrite(faqVO);

		ModelAndView mav = new ModelAndView("redirect:/board/faqList.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/board/faqView.do", method= RequestMethod.GET)
	public ModelAndView faqView(@RequestParam("faq_no") int faq_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		FaqVO faqVO = faqService.faqView(faq_no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("faqVO", faqVO);
		// 조회수 증가
		faqService.increaseHits(faq_no);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/board/faqMod.do", method=RequestMethod.POST)
	public ModelAndView faqMod(@RequestParam("faq_no") int faq_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		FaqVO faqVO = faqService.faqMod(faq_no);
		ModelAndView mav = new ModelAndView("faqMod");
		mav.addObject("faqVO", faqVO);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/faqMod.do", method=RequestMethod.POST)
	public ModelAndView faqModify(@ModelAttribute("faq_no") FaqVO faqVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		faqVO.getFaq_no();
		faqService.faqModify(faqVO);
		ModelAndView mav = new ModelAndView("redirect:/board/faqList.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/board/faqRemove.do", method= RequestMethod.POST)
	public ModelAndView faqRemove(@RequestParam("faq_no") int faq_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		faqService.faqRemove(faq_no);
		ModelAndView mav = new ModelAndView("redirect:/board/faqList.do");
		return mav;
	}
}