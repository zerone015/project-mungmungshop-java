package com.myspring.petshop.review.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.myspring.petshop.board.event.controller.EventControllerImpl;

@Controller
public class ReviewControllerImpl implements ReviewController {
	
	
	@Autowired
	private HttpSession session;

	private static final Logger logger = LoggerFactory.getLogger(EventControllerImpl.class);
	
	
}
