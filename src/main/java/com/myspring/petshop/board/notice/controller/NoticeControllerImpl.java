package com.myspring.petshop.board.notice.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.myspring.petshop.board.notice.service.NoticeService;
import com.myspring.petshop.board.notice.vo.NoticeVO;
import com.myspring.petshop.member.vo.MemberVO;

@Controller("noticeController")
@EnableAspectJAutoProxy
public class NoticeControllerImpl implements NoticeController {

	@Autowired
	private NoticeService noticeService;
	@Autowired
	private NoticeVO noticeVO;
	@Autowired
	private MemberVO memberVO; 
	@Autowired
	private HttpSession session;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeControllerImpl.class);
	
	@Override
	@RequestMapping(value = "/board/noticeList.do", method = RequestMethod.GET)
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");	
		session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		int manager;
		if(memberVO != null) {
			 manager = memberVO.getMember_manager();
		}
		else {
			 manager = 1234;
		}
		
		List noticeList = noticeService.listNotice();
		ModelAndView mav = new ModelAndView("/board/noticeList");
		mav.addObject("noticeList", noticeList);
		mav.addObject("manager", manager);
		return mav;
		
	
		
		
	}
	
	@RequestMapping(value = "/board/noticeWrite.do", method = RequestMethod.GET)
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		String ID = memberVO.getMember_id();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("ID", ID);
		mav.setViewName("/board/noticeWrite");
		
		return mav;
	}
	
	
	@RequestMapping(value = "/noticeWrite.do", method= RequestMethod.POST)
	public ModelAndView noticeWrite(@ModelAttribute("notice")NoticeVO notice, HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		request.setCharacterEncoding("utf-8");
		
		noticeService.noticeWrite(notice);
		
		ModelAndView mav = new ModelAndView("redirect:/board/noticeList.do");
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/board/noticeView.do", method=RequestMethod.GET)
	public ModelAndView noticeView(@RequestParam("notice_no") int notice_no,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		int manager;
		if(memberVO != null) {
			manager = memberVO.getMember_manager();
		}
		else {
			manager = 1234;
		}

		noticeVO = noticeService.viewNotice(notice_no);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/noticeView");
		mav.addObject("noticeVO", noticeVO);
		mav.addObject("manager", manager);
		return mav;
		
	}
	
	
	@RequestMapping(value="/board/noticeRemove.do", method=RequestMethod.GET)
	public ModelAndView noticeRemove(@RequestParam("notice_no") int notice_no,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		noticeService.noticeRemove(notice_no);
		
		ModelAndView mav = new ModelAndView("redirect:/board/noticeList.do");
		return mav;
	}
	
	
	
	@Override
	@RequestMapping(value="/board/noticeMod.do", method=  RequestMethod.GET)
	public ModelAndView noticeMod(@RequestParam("notice_no") int notice_no,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		noticeVO = noticeService.noticeMod(notice_no);
		ModelAndView mav = new ModelAndView("/board/noticeMod");
		mav.addObject("noticeVO", noticeVO);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/noticeMod.do", method= RequestMethod.POST)
	public ModelAndView noticeModify(@ModelAttribute("notice_no") NoticeVO noticeVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		noticeService.noticeModify(noticeVO);
		ModelAndView mav = new ModelAndView("redirect:/board/noticeList.do");
		return mav;
	}
			
}
