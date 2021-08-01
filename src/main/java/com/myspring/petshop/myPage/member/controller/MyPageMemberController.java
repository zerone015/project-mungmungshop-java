package com.myspring.petshop.myPage.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.member.vo.MemberVO;

public interface MyPageMemberController {
	public String pwCertifyForm() throws Exception;
	public String newPwForm() throws Exception;
	public String quitForm() throws Exception;
	public ResponseEntity getNewPw(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception;
	public ResponseEntity modPw(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception;
	public ResponseEntity getInfoModify(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception;
	public String infoCertifyForm() throws Exception;
	public ModelAndView InfoModifyForm(HttpServletRequest request) throws Exception;
	public ResponseEntity modifyInfo(@ModelAttribute("member") MemberVO member, HttpServletRequest request) throws Exception;
	public ResponseEntity removeMember(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception;
}
