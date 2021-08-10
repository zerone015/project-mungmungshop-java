package com.myspring.petshop.love.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.love.service.LoveService;
import com.myspring.petshop.love.vo.LoveVO;
import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.product.vo.ProductVO;

@Controller
public class LoveControllerImpl implements LoveController {
	@Autowired
	private LoveService loveService;
	
	@Override
	@ResponseBody
	@RequestMapping(value="/love/modLove.do", method = RequestMethod.POST)
	public int modLove(@ModelAttribute("love") LoveVO love, HttpSession session, HttpServletRequest request) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int member_num = memberVO.getMember_num();
		love.setMember_num(member_num);
		int result = loveService.getLoveCnt(love);
		
		if(result == 0) {
			loveService.addLove(love);
		}
		else {
			loveService.removeLove(love);
		}
			
		return result;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value="/love/getProductLoves.do", method = RequestMethod.POST)
	public int getProductLoves(@RequestParam("p_code") String p_code, HttpServletRequest request) throws Exception {
		int p_loves = loveService.getProductLove(p_code);
		return p_loves;
	}
	
	@Override
	@RequestMapping(value="/myPage/getLoveList.do", method = RequestMethod.GET)
	public ModelAndView getProductLoves(@RequestParam(required = false, defaultValue = "1") int page,
							            @RequestParam(required = false, defaultValue = "1") int range,HttpSession session) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int member_num = memberVO.getMember_num();
		
		int listCnt = loveService.getLoveListCnt(member_num);
		
		Pagination pagination = new Pagination();
		pagination.setListSize(9);
		pagination.pageInfo(page, range, listCnt);
		
		Map<String, Object> loveMap = new HashMap<String, Object>();
		loveMap.put("pagination", pagination);
		loveMap.put("member_num", member_num);
		
		List<ProductVO> loveList = loveService.getLoveList(loveMap);
		
		ModelAndView mav = new ModelAndView("love");
		mav.addObject("pagination", pagination);
		mav.addObject("loveList", loveList);
		
		return mav;
	}
}
