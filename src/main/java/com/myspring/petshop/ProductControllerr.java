package com.myspring.petshop;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductControllerr {
	
	
	@RequestMapping(value = "/productList.do", method = RequestMethod.GET)
	public String homee(Locale locale, Model model) {
		
		return "productList";
	}
	
	@RequestMapping(value = "/product.do", method = RequestMethod.GET)
	public String homeeeeee(Locale locale, Model model) {
		
		
		return "product";
	}
	
	@RequestMapping(value = "/newProduct.do", method = RequestMethod.GET)
	public String newProduct(Locale locale, Model model) {
		
		
		return "newProduct";
	}
	
	@RequestMapping(value = "/brandProducts.do", method = RequestMethod.GET)
	public String brandProducts(Locale locale, Model model) {
		
		
		return "brandProducts";
	}
	
	@RequestMapping(value = "/brandList.do", method = RequestMethod.GET)
	public String homeee(Locale locale, Model model) {
		
		
		return "brandList";
	}
	
	@RequestMapping(value = "/rankList.do", method = RequestMethod.GET)
	public String homeeee(Locale locale, Model model) {
	
		
		return "rankList";
	}
	
	
	
	
	
	@RequestMapping(value = "/saleList.do", method = RequestMethod.GET)
	public String saleList(Locale locale, Model model) {

		
		return "saleList";
	}
	
	@RequestMapping(value = "/searchList.do", method = RequestMethod.GET)
	public String searchList(Locale locale, Model model) {

		
		return "searchList";
	}
	
}
