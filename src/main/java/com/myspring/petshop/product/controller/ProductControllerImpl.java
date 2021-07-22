package com.myspring.petshop.product.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.product.service.ProductService;
import com.myspring.petshop.product.vo.ProductVO;

@Controller("productController")
public class ProductControllerImpl implements ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductVO product;
	
	@Override
	@RequestMapping(value="/product/productList.do", method = RequestMethod.GET)
	public ModelAndView getProducts(@ModelAttribute("category") ProductVO category,
			@RequestParam(value="sortBy", required=false, defaultValue="default") String sortBy,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("productList");
		
		int listCnt = productService.productsCnt(category);
		
		Pagination pagination = new Pagination();
		pagination.setListSize(9);
		pagination.pageInfo(page, range, listCnt);
		
		HashMap<String, Object> productInfo = new HashMap<String, Object>();
		productInfo.put("category", category);
		productInfo.put("pagination", pagination);
		
		List products = null;
		
		
		if(sortBy.equals("default")) {
			products = productService.getProducts(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("love")) {
			products = productService.getLoveRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("new")) {
			products = productService.getNewRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("lowPrice")) {
			products = productService.getLowPriceRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("highPrice")) {
			products = productService.getHighPriceRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else{
			mav.setViewName("pageError");
		}
	
		mav.addObject("pagination", pagination);
		mav.addObject("category", category);
		mav.addObject("sortBy", sortBy);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/product/getProduct.do", method = RequestMethod.GET)
	public ModelAndView getProduct(@RequestParam("p_code") String p_code) throws Exception {
		product = productService.getProduct(p_code);
		
		ModelAndView mav = new ModelAndView("product");
		mav.addObject("product", product);
		
		return mav;
	}
	

	/*
	 * @Override
	 * 
	 * @RequestMapping(value="/product/getPayment.do", method = RequestMethod.GET)
	 * public ModelAndView getPayment(@RequestParam("p_code") String p_code) throws
	 * Exception {
	 * 
	 * ModelAndView mav = new ModelAndView();
	 * 
	 * return mav; }
	 */
}
