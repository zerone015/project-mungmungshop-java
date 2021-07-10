package com.myspring.petshop.manager.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.Pagination;
import com.myspring.petshop.manager.service.ManagerService;
import com.myspring.petshop.manager.vo.ManagerVO;
import com.myspring.petshop.product.vo.ProductVO;

@Controller
public class ManagerControllerImpl implements ManagerController {
	@Autowired
	private ManagerService managerService;
	
	@Override
	@RequestMapping(value="/manager/addProduct.do", method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") ProductVO product,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		managerService.addProduct(product);
		ModelAndView mav = new ModelAndView("redirect:/manager/managerProduct.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/managerProduct.do", method = RequestMethod.GET)
	public ModelAndView listProducts(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int listCnt = managerService.productsCnt();
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		List products = managerService.listProducts(pagination);
		
		ModelAndView mav = new ModelAndView("managerProduct");
		mav.addObject("pagination", pagination);
		mav.addObject("products", products);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/managerProductInfo.do", method = RequestMethod.GET)
	public ModelAndView getProduct(String p_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ProductVO product = managerService.getProduct(p_code);
		ModelAndView mav = new ModelAndView("managerProductInfo");
		mav.addObject("product", product);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/managerProductModify.do", method = RequestMethod.GET)
	public String getModifyProduct(@RequestParam("p_code") String p_code,
			HttpServletRequest request,HttpServletResponse response, Model model) throws Exception {
		
		ProductVO product = managerService.getModifyProduct(p_code);
		model.addAttribute("product", product);

		return "managerProductModify";	
	}
	
	@Override
	@RequestMapping(value="/manager/modifyProduct.do", method = RequestMethod.POST)
	public ModelAndView modifyProduct(@ModelAttribute("product") ProductVO product,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		managerService.modifyProduct(product);
		ModelAndView mav = new ModelAndView("redirect:/manager/managerProduct.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/removeProduct.do", method = RequestMethod.GET)
	public ModelAndView removeProduct(@RequestParam("p_code") String p_code,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		managerService.removeProduct(p_code);
		ModelAndView mav = new ModelAndView("redirect:/manager/managerProduct.do");
		
		return mav;
	}
}
