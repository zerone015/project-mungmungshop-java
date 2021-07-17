package com.myspring.petshop.mail.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.petshop.member.vo.MemberVO;

public interface MailService{
	public String getEmail(MemberVO member) throws Exception;
	public int getEmailCnt(String email) throws Exception;
	
	
}