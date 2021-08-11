package com.myspring.petshop.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.product.vo.ProductVO;

public interface ProductController {
	public ModelAndView getProducts(@ModelAttribute("category") ProductVO category,
			@RequestParam(value="sortBy", required=false, defaultValue="default") String sortBy,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	

	public ModelAndView getProduct(String p_code, int page, int range, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView brandProducts(@RequestParam("brandName") String brandName,
			@RequestParam(value="sortBy", required=false, defaultValue="default") String sortBy,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView newProduct(String sortBy, int page, int range, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	
	public ModelAndView searchProducts(
			@RequestParam(value="searchWord", required=false, defaultValue="null") String searchWord,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView getRankProducts(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
