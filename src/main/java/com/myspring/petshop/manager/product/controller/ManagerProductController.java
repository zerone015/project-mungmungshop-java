package com.myspring.petshop.manager.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.member.vo.MemberVO;

public interface ManagerProductController {
	public ModelAndView addProduct(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView listProducts(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(value="sortBy", required=false, defaultValue="default") String sortBy,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView getProduct(String p_code, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public String getModifyProduct(@RequestParam("p_code") String p_code,
			HttpServletRequest request,HttpServletResponse response, Model model) throws Exception;
	
	public ResponseEntity modifyProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	public ResponseEntity removeProduct(@RequestParam("p_code") String p_code,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public ModelAndView getSearchProducts(@RequestParam("searchBy") String searchBy,
			@RequestParam("searchContents") String searchContents,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range ) throws Exception;
	
	
}
