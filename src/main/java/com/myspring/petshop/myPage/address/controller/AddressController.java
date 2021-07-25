package com.myspring.petshop.myPage.address.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.myPage.address.vo.AddressVO;


public interface AddressController {
	public ModelAndView addAddress(@ModelAttribute("address") AddressVO address,
			HttpServletRequest request,HttpServletResponse response) throws Exception;
	
	public ModelAndView getAddressList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String addressWrite() throws Exception;
	
	public ModelAndView modAddress(@RequestParam("address_num") int address_num,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView removeAddress(@ModelAttribute("address") AddressVO address, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
	public ModelAndView modifyAddress(@ModelAttribute("address") AddressVO address,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
