package com.myspring.petshop.cart.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.cart.vo.CartVO;
import com.myspring.petshop.manager.product.vo.ManagerProductVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface CartController {
	public ModelAndView getMyCartList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String addProductsInCart(@ModelAttribute("cart") CartVO cart,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
}
