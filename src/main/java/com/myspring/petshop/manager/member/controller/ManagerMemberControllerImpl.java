package com.myspring.petshop.manager.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.member.service.ManagerMemberService;

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
}
