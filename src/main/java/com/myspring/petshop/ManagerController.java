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
public class ManagerController {

private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);

@RequestMapping(value = "/managerMain.do", method = RequestMethod.GET)
public String managerMain(Locale locale, Model model) {
	
	
	return "managerMain";
}

@RequestMapping(value = "/managerProduct.do", method = RequestMethod.GET)
public String managerProduct(Locale locale, Model model) {

	
	return "managerProduct";
}

@RequestMapping(value = "/managerProductList.do", method = RequestMethod.GET)
public String managerProductList(Locale locale, Model model) {

	
	return "managerProductList";
}

@RequestMapping(value = "/managerProductAdd.do", method = RequestMethod.GET)
public String managerProductAdd(Locale locale, Model model) {

	
	return "managerProductAdd";
}

@RequestMapping(value = "/managerProductModify.do", method = RequestMethod.GET)
public String managerProductModify(Locale locale, Model model) {

	
	return "managerProductModify";
}

@RequestMapping(value = "/managerOrderList.do", method = RequestMethod.GET)
public String managerOrderList(Locale locale, Model model) {
	
	
	return "managerOrderList";
}
	
}
