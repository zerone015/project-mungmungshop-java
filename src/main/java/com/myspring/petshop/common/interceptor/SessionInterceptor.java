package com.myspring.petshop.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myspring.petshop.member.vo.MemberVO;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		try {
			if (member != null && member.getMember_id() != null) {
				return true;
			}
			else {
				ModelAndView mav = new ModelAndView("redirect:/login.do");
				mav.addObject("returnUrl", "/login.do");
				throw new ModelAndViewDefiningException(mav);
			}
		}catch (Exception e) {
			ModelAndView mav = new ModelAndView("redirect:/login.do");
			mav.addObject("returnUrl", "/login.do");
			throw new ModelAndViewDefiningException(mav);
		}
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	
	}

}
	
