package com.myspring.petshop.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.main.service.MainService;
import com.myspring.petshop.product.vo.ProductVO;

@Controller
@EnableAspectJAutoProxy
public class MainControllerImpl implements MainController{
	@Autowired
	private MainService mainService;
	
	@Override
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
	public ModelAndView main() throws Exception {
		List<ProductVO> newProductList = mainService.getNewProducts();
		List<ProductVO> rankProductList = mainService.getRankProducts();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("newProductList", newProductList);
		mav.addObject("rankProductList", rankProductList);
		mav.setViewName("main");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/null", method = RequestMethod.GET)
	public String main2() throws Exception {
		
		return "redirect:/main.do";
	}
}