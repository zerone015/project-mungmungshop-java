package com.myspring.petshop.member.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.petshop.member.service.MemberService;
import com.myspring.petshop.member.vo.MemberVO;

@Controller("memberController")
@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	
	@Override
	@ResponseBody
	@RequestMapping(value="/member/idChk", method = RequestMethod.POST)
	public int getIdCnt(MemberVO vo) throws Exception {
		int result = memberService.getIdCnt(vo);
		return result;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value="/member/nickChk", method = RequestMethod.POST)
	public int getNickNameCnt(MemberVO vo) throws Exception {
		int result = memberService.getNickNameCnt(vo);
		return result;
	}
		
	@Override
	@RequestMapping(value="/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		if(memberVO != null) {
			String remember_userId = request.getParameter("remember_userId");
			Cookie cookie = new Cookie("rememberId", memberVO.getMember_ID());		
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			cookie.setPath("/");
			if(remember_userId == null) {	
				cookie.setMaxAge(0);
			} 
			else if(remember_userId != null && remember_userId.trim().equals("checked")) {	
				cookie.setMaxAge(60*60*24*30);
			}
			response.addCookie(cookie);
			mav.setViewName("redirect:/main.do");
		}else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/login.do");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/joinAgree.do", method=RequestMethod.GET)
	public ModelAndView joinAgree(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/addMember.do", method=RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member")MemberVO member, HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		request.setCharacterEncoding("utf-8");
		memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/joinWelcome.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/joinWelcome.do", method=RequestMethod.GET)
	public ModelAndView joinWelcome(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/resultId.do", method = RequestMethod.POST)
	public ModelAndView findId(@ModelAttribute("member")MemberVO member,RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		List memberId = memberService.findId(member);
		ModelAndView mav = new ModelAndView();
		if (memberId.size() == 0) {
			rAttr.addAttribute("memberId", "notExists");
			mav.setViewName("redirect:/findId.do");
		}else {
			mav.addObject("memberId", memberId);
			mav.setViewName("resultId");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/changePw.do", method = RequestMethod.POST)
	public ModelAndView changePwView(@ModelAttribute("member")MemberVO member, HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		String id = member.getMember_ID();
		String email = member.getMember_email();
		String originalPw = member.getMember_PW();
		ModelAndView mav = new ModelAndView("changePw");
		mav.addObject("id", id);
		mav.addObject("email", email);
		mav.addObject("originalPw", originalPw);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/updatePw.do", method = RequestMethod.POST)
	public ModelAndView changePw(@ModelAttribute("member")MemberVO member, HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		memberService.changePw(member);
		ModelAndView mav = new ModelAndView("redirect:/changePwResult.do");
		
		return mav;
	}
	
}