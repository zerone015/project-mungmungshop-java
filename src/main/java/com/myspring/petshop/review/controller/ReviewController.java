package com.myspring.petshop.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.review.vo.ReviewVO;

public interface ReviewController {

//	public ModelAndView review(ReviewVO reviewVO, int page, int range, HttpServletRequest request,
//			HttpServletResponse response) throws Exception;

	public ModelAndView reviewWriteForm(String p_code, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView reviewWrite(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ModelAndView review(ReviewVO reviewVO, int page, int range, HttpServletRequest request,
			HttpServletResponse response) throws Exception;

}
