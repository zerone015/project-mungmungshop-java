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
				String interceptor = "Execution";
				session.setAttribute("interceptor", interceptor);
				
				String referer = request.getHeader("Referer");
				
				if(
						!referer.equals("http://localhost:8080/petshop/login.do") && 
						!referer.equals("http://localhost:8080/petshop/member/joinAgree.do") &&
						!referer.equals("http://localhost:8080/petshop/joinMember.do") &&
						!referer.equals("http://localhost:8080/petshop/member/joinWelcome.do") &&
						!referer.equals("http://localhost:8080/petshop/findId.do") &&
						!referer.equals("http://localhost:8080/petshop/member/resultId.do") &&
						!referer.equals("http://localhost:8080/petshop/findPw.do") &&
						!referer.equals("http://localhost:8080/petshop/mail/findPwCheck.do") &&
						!referer.equals("http://localhost:8080/petshop/member/changePw.do") &&
						!referer.equals("http://localhost:8080/petshop/changePwResult.do") &&
						!referer.equals("http://localhost:8080/petshop/payment/getPaymentPage.do") &&
						!referer.equals("http://localhost:8080/petshop/payment/getPaymentResult.do") &&
						!referer.equals("http://localhost:8080/petshop/myPage/infoCertify.do") &&
						!referer.equals("http://localhost:8080/petshop/myPage/infoModify.do") &&
						!referer.equals("http://localhost:8080/petshop/myPage/quit.do") &&
						!referer.equals("http://localhost:8080/petshop/myPage/pwCertify.do") &&
						!referer.equals("http://localhost:8080/petshop/myPage/newPW.do") &&
						!referer.equals("http://localhost:8080/petshop/address/addressList.do") &&
						!referer.equals("http://localhost:8080/petshop/myPage/addOrderRefund.do") &&
						!referer.equals("http://localhost:8080/petshop/myPage/getRefundPage.do") &&
						!referer.equals("http://localhost:8080/petshop/myPage/modPw.do") &&	
						!referer.equals("http://localhost:8080/petshop/manager/modOrderStatus.do") &&
						!referer.equals("http://localhost:8080/petshop/board/qnaWrite.do") && 
						!referer.equals("http://localhost:8080/petshop/qnaWrite.do") && 
						!referer.equals("http://localhost:8080/petshop/board/qnaView.do") &&
						!referer.equals("http://localhost:8080/petshop/board/qnaMod.do") &&
						!referer.equals("http://localhost:8080/petshop/board/qnaReply.do") &&
						!referer.equals("http://localhost:8080/petshop/qnaReply.do") &&
						!referer.equals("http://localhost:8080/petshop/board/qnaRemove.do") &&
						!referer.equals("http://localhost:8080/petshop/board/qnaRemove2.do")
					){
					session.setAttribute("referer", referer);
				}	
				
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
	
