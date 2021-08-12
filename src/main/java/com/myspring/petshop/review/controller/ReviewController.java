package com.myspring.petshop.review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.petshop.review.vo.ReviewVO;

public interface ReviewController {

	public ModelAndView review(
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView reviewWriteForm(String p_code, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public int reviewWrite(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public ModelAndView reviewModForm(int review_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public String reviewMod(int review_num, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;

}
