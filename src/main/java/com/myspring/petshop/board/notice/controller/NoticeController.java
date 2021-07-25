package com.myspring.petshop.board.notice.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.board.notice.vo.NoticeVO;

public interface NoticeController{
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView noticeWrite(NoticeVO noice, HttpServletRequest reuqest, HttpServletResponse response) throws Exception;
	
	public ModelAndView noticeView(int notice_no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView noticeRemove(int notice_no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView noticeMod( int notice_no,	HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView noticeModify(NoticeVO noticeVO,	HttpServletRequest request, HttpServletResponse response) throws Exception;
}
	