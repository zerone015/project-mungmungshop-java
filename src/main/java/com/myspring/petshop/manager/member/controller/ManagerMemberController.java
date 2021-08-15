package com.myspring.petshop.manager.member.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.member.vo.MemberVO;


public interface ManagerMemberController {
	public ModelAndView getMembersList(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception;
	
	public ModelAndView getMemberInfo(@RequestParam("member_num") int member_num) throws Exception;
	
	public ModelAndView getSearchMembers(@RequestParam("searchBy") String searchBy,
			@RequestParam("searchContents") String searchContents,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range ) throws Exception;
	
	public ModelAndView modMemberForm(@RequestParam("member_num") int member_num) throws Exception;
	public ResponseEntity modMember(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request) throws Exception;
}
