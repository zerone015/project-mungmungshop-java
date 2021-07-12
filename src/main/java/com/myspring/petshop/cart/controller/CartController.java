package com.myspring.petshop.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.manager.vo.ManagerVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface CartController {
	public String addProductsInCart(@RequestParam("p_code") String p_code,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView getMyCartList(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
