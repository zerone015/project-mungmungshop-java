package com.myspring.petshop;


import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CartController {
	
private static final Logger logger = LoggerFactory.getLogger(CartController.class);

@RequestMapping(value = "/cart.do", method = RequestMethod.GET)
public String cart(Locale locale, Model model) {
	
	return "cart";
}


}
