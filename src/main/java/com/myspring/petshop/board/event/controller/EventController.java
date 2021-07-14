package com.myspring.petshop.board.event.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.board.event.vo.EventVO;

public interface EventController{
	public ModelAndView eventList(int page, int range, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView eventWrite(EventVO event, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView eventMod(int event_no, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView eventView(int event_no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView eventRemove(int event_no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView eventModify(EventVO event, HttpServletRequest request, HttpServletResponse response) throws Exception;



}