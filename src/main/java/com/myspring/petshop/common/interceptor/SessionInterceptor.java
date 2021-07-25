package com.myspring.petshop.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myspring.petshop.member.vo.MemberVO;

public class SessionInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("member");
		String contextPath = request.getContextPath();
		try {
			if (member == null) {
				if(isAjaxRequest(request)) {
					response.sendError(400);
				}
				else {
					response.sendRedirect(contextPath+"/login.do");
				}
				return false;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	
	}

	private boolean isAjaxRequest(HttpServletRequest req) {
		String header = req.getHeader("AJAX");
	    if ("true".equals(header)){
	    	return true;
	   }
	    else{
	        return false;
	   }
	}

}
	