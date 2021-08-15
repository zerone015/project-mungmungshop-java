package com.myspring.petshop.myPage.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.member.vo.MemberVO;

public interface MyPageMemberController {
	public String pwCertifyForm(Model model) throws Exception;
	public String newPwForm(Model model) throws Exception;
	public String quitForm(Model model) throws Exception;
	public ResponseEntity getNewPw(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception;
	public ResponseEntity modPw(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception;
	public ResponseEntity getInfoModify(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception;
	public String infoCertifyForm(Model model) throws Exception;
	public ModelAndView InfoModifyForm(HttpServletRequest request) throws Exception;
	public ResponseEntity modifyInfo(@ModelAttribute("member") MemberVO member, HttpServletRequest request) throws Exception;
	public ResponseEntity removeMember(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception;
}
