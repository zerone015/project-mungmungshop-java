package com.myspring.petshop.myPage.member.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.myPage.member.service.MyPageMemberService;

@Controller
public class MyPageMemberControllerImpl implements MyPageMemberController {
	@Autowired
	private MyPageMemberService myPageMemberService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	
	@Override
	@RequestMapping(value ="/myPage/pwCertify.do", method = RequestMethod.GET)
	public String pwCertifyForm(Model model) throws Exception {
		model.addAttribute("pwClick", true);
		
		return "pwCertify";
	}
	
	@Override
	@RequestMapping(value ="/myPage/newPW.do", method = RequestMethod.GET)
	public String newPwForm(Model model) throws Exception {
		model.addAttribute("pwClick", true);
		
		return "newPW";
	}
	
	@Override
	@RequestMapping(value = "/myPage/infoCertify.do", method = RequestMethod.GET)
	public String infoCertifyForm(Model model) throws Exception {
		model.addAttribute("infoClick", true);

		return "infoCertify";
	}
	
	@Override
	@RequestMapping(value = "/myPage/quit.do", method = RequestMethod.GET)
	public String quitForm(Model model) throws Exception {
		model.addAttribute("infoClick", true);

		return "quit";
	}
	
	@Override
	@RequestMapping(value = "/myPage/infoModify.do", method = RequestMethod.GET)
	public ModelAndView InfoModifyForm(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		
		ModelAndView mav = new ModelAndView("infoModify");
		mav.addObject("memberVO", memberVO);
		mav.addObject("infoClick", true);

		return mav;
	}
	
	@Override
	@RequestMapping(value = "/myPage/getInfoModify.do", method = RequestMethod.POST)
	public ResponseEntity getInfoModify(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		boolean passMatch = passEncoder.matches(member_pw, memberVO.getMember_pw());
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		if(passMatch) {
			message = "<script>";
			message += "location.href='" + request.getContextPath() + "/myPage/infoModify.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}
		else {
			message = "<script>";
			message += "alert('비밀번호가 일치하지 않습니다.');";
			message += "location.href='" + request.getContextPath() + "/myPage/infoCertify.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/myPage/getNewPw.do", method = RequestMethod.POST)
	public ResponseEntity getNewPw(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		boolean passMatch = passEncoder.matches(member_pw, memberVO.getMember_pw());
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		if(passMatch) {
			message = "<script>";
			message += "location.href='" + request.getContextPath() + "/myPage/newPW.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}
		else {
			message = "<script>";
			message += "alert('비밀번호가 일치하지 않습니다.');";
			message += "location.href='" + request.getContextPath() + "/myPage/pwCertify.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/myPage/modPw.do", method = RequestMethod.POST)
	public ResponseEntity modPw(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
	
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		boolean passMatch = passEncoder.matches(member_pw, memberVO.getMember_pw());
		
		if(passMatch) {
			message = "<script>";
			message += "alert('현재 비밀번호와 다른 비밀번호로 변경해주세요.');";
			message += "location.href='" + request.getContextPath() + "/myPage/newPW.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
		}
		
		else {
			try {
				member_pw = passEncoder.encode(member_pw);
				memberVO.setMember_pw(member_pw);
				myPageMemberService.modPw(memberVO);
				session.removeAttribute("member");
				message = "<script>";
				message += "alert('변경이 완료되었습니다.다시 로그인 해주세요.');";
				message += "location.href='" + request.getContextPath() + "/login.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			}catch(Exception e) {
				message = "<script>";
				message += "alert('오류가 발생하였습니다.');";
				message += "location.href='" + request.getContextPath() + "/myPage/pwCertify.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
				e.printStackTrace();
			}
		}
		
		return resEnt;
	}
	
	
	@Override
	@RequestMapping(value = "/myPage/modifyInfo.do", method = RequestMethod.POST)
	public ResponseEntity modifyInfo(@ModelAttribute("member") MemberVO member, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		int member_num = memberVO.getMember_num();
		member.setMember_num(member_num);
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			myPageMemberService.modifyInfo(member);
			session.removeAttribute("member");
			message = "<script>";
			message += "alert('회원 정보 수정을 완료하였습니다.다시 로그인 해주세요.');";
			message += "location.href='" + request.getContextPath() + "/login.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류가 발생하였습니다.');";
			message += "location.href='" + request.getContextPath() + "/myPage/infoModify.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/myPage/removeMember.do", method = RequestMethod.POST)
	public ResponseEntity removeMember(@RequestParam("member_pw") String member_pw, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		
		boolean passMatch = passEncoder.matches(member_pw, memberVO.getMember_pw());
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		if(!passMatch) {
			message = "<script>";
			message += "alert('비밀번호가 일치하지 않습니다. 다시 시도해주세요.');";
			message += "location.href='" + request.getContextPath() + "/myPage/quit.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
		}else {
			try {
				myPageMemberService.removeMember(memberVO);
				session.removeAttribute("member");
				message = "<script>";
				message += "alert('회원 탈퇴를 완료하였습니다.그동안 저희 사이트를 이용해주셔서 감사합니다.');";
				message += "location.href='" + request.getContextPath() + "/main.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			}catch(Exception e) {
				message = "<script>";
				message += "alert('오류가 발생하였습니다.');";
				message += "location.href='" + request.getContextPath() + "/myPage/quit.do';";
				message += " </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
				e.printStackTrace();
			}
		}
		
		return resEnt;
	}
}

