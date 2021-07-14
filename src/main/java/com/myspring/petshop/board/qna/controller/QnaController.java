package com.myspring.petshop.board.qna.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.board.qna.vo.QnaVO;

public interface QnaController {

	public ModelAndView qnaList(@RequestParam(required = false, defaultValue = "1") int page,
							    @RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView qnaWrite(QnaVO qnaVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView qnaView(int qna_no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView qnaModify(QnaVO qnaVO, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView qnaMod(int qna_no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView qnaRemove(int qna_no, HttpServletRequest request, HttpServletResponse response) throws Exception;

	
}
