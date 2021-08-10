package com.myspring.petshop.love.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.love.vo.LoveVO;

public interface LoveController {
	public int modLove(@ModelAttribute("love") LoveVO love, HttpSession session, HttpServletRequest request) throws Exception;
	public int getProductLoves(@RequestParam("p_code") String p_code, HttpServletRequest request) throws Exception;
	public ModelAndView getProductLoves(@RequestParam(required = false, defaultValue = "1") int page,
			   @RequestParam(required = false, defaultValue = "1") int range,HttpSession session) throws Exception;
}
