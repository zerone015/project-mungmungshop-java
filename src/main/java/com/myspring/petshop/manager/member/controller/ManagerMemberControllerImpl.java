package com.myspring.petshop.manager.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.member.service.ManagerMemberService;
import com.myspring.petshop.member.vo.MemberVO;

@Controller
public class ManagerMemberControllerImpl implements ManagerMemberController {
	@Autowired
	private ManagerMemberService managerService;

	@Override
	@RequestMapping(value="/manager/getMembersList.do", method = RequestMethod.GET)
	public ModelAndView getMembersList(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		int listCnt = managerService.membersCnt();
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		List members = managerService.getMembersList(pagination);
		
		ModelAndView mav = new ModelAndView("managerMember");
		mav.addObject("pagination", pagination);
		mav.addObject("members", members);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/getMemberInfo.do", method = {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView getMemberInfo(@RequestParam("member_num") int member_num) throws Exception {
		ModelAndView mav = new ModelAndView("managerMemberInfo");
	
		MemberVO memberVO = managerService.getMemberInfo(member_num);
		mav.addObject("memberVO", memberVO);
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/manager/removeMembers.do", method = RequestMethod.POST)
	public String removeMembers(@RequestParam("member_num") int member_num) throws Exception {
		boolean result = managerService.removeMembers(member_num);
	
		if (result == true) {
			return "remove_success";
		}
		else {
			return "remove_failed";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/manager/modMemberGrant.do", method = RequestMethod.POST)
	public String modMemberGrant(@RequestParam("member_num") int member_num) throws Exception {
		boolean result = managerService.modMemberGrant(member_num);
		
		if (result == true) {
			return "grant_success";
		}
		else {
			return "grant_failed";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/manager/modMemberRevoke.do", method = RequestMethod.POST)
	public String modMemberRevoke(@RequestParam("member_num") int member_num) throws Exception {
		boolean result = managerService.modMemberRevoke(member_num);
		
		if (result == true) {
			return "revoke_success";
		}
		else {
			return "revoke_failed";
		}
	}
	
	@Override
	@RequestMapping(value="/manager/getSearchMembers.do", method = RequestMethod.GET)
	public ModelAndView getSearchMembers(@RequestParam("searchBy") String searchBy,
			@RequestParam("searchContents") String searchContents,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range ) throws Exception {
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchBy", searchBy);
		searchMap.put("searchContents", searchContents);
		
		int	listCnt = managerService.searchMembersCnt(searchMap);
	
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		searchMap.put("pagination", pagination);
		
		List members = managerService.getSearchMembers(searchMap);
		
		ModelAndView mav = new ModelAndView("managerMember");
		mav.addObject("members", members);
		mav.addObject("pagination", pagination);
		mav.addObject("searchBy", searchBy);
		mav.addObject("searchContents", searchContents);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/modMemberForm.do", method = RequestMethod.POST)
	public ModelAndView modMemberForm(@RequestParam("member_num") int member_num) throws Exception {
		ModelAndView mav = new ModelAndView("managerMemberMod");
		
		MemberVO memberVO = managerService.getMemberInfo(member_num);
		mav.addObject("memberVO", memberVO);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/modMember.do", method = RequestMethod.POST)
	public ResponseEntity modMember(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request) throws Exception {
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			managerService.modMember(memberVO);
			message = "<script>";
			message += "alert('회원정보 수정을 완료하였습니다.');";
			message += "location.href='" + request.getContextPath() + "/manager/getMemberInfo.do?member_num=" + memberVO.getMember_num() + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류 발생. 다시 시도해주세요.');";
			message += "location.href='" + request.getContextPath() + "/manager/getMemberInfo.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return resEnt;
	}
}
