package com.myspring.petshop.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.petshop.member.vo.MemberVO;

public interface MemberController{
	public int getIdCnt(MemberVO vo) throws Exception;
	
	public int getNickNameCnt(MemberVO vo) throws Exception;
	
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
	RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String joinAgree(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView addMember(@ModelAttribute("info")
	MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String joinWelcome(HttpServletRequest request, HttpServletResponse response)throws Exception;
	
	public ModelAndView findId(@ModelAttribute("member")MemberVO member,RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView changePwView(@RequestParam("member_id") String id,
									 @RequestParam("member_email") String email,
									 HttpServletRequest request,HttpServletResponse response)throws Exception;	
	
	public ModelAndView changePw(@ModelAttribute("member")MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response)throws Exception;

	
	
}