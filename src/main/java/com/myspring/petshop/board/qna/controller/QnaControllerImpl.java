package com.myspring.petshop.board.qna.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.board.qna.service.QnaService;
import com.myspring.petshop.board.qna.vo.QnaVO;
import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.member.vo.MemberVO;

@Controller("qnaController")
@EnableAspectJAutoProxy
public class QnaControllerImpl implements QnaController {
	@Autowired
	private QnaService qnaService;
	@Autowired
	private QnaVO qnaVO;
	@Autowired
	private MemberVO memberVO; 
	@Autowired
	private HttpSession session;
	

	private static final Logger logger = LoggerFactory.getLogger(QnaControllerImpl.class);
	
	@RequestMapping(value = "/board/qnaList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView qnaList(@RequestParam(required = false, defaultValue = "1") int page,
								@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView("/board/qnaList");
		
		// 게시글 총 개수
		int listCnt = qnaService.qnaCnt();
		
		Pagination pagination = new Pagination();
		pagination.setListSize(10);
		pagination.pageInfo(page, range, listCnt);
		
		List qnaList = qnaService.listQna(pagination);
		
		mav.addObject("pagination", pagination);
		mav.addObject("qnaList", qnaList);
		
		return mav;
	}
	
	@RequestMapping(value = "/board/qnaWrite.do", method = RequestMethod.GET)
	public String eventWrite(Locale locale, Model model) {

		return "/board/qnaWrite";
	}
	
	@Override
	@RequestMapping(value="/qnaWrite.do", method=RequestMethod.POST)
	public ModelAndView qnaWrite(@ModelAttribute("qna") QnaVO qnaVO, HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		int result=0;
		
//		게시글이 없을 경우 originNo = 1, 
//		게시글 있을 경우 originNo = 게시글 번호 + 1
		Integer qnaMaxNo = qnaService.qnaMaxNo();
		System.out.println(qnaMaxNo);
		int i = qnaMaxNo != null ? qnaMaxNo + 1 : 1;
		qnaVO.setQna_originNo(i);
		
		result = qnaService.qnaWrite(qnaVO);

		ModelAndView mav = new ModelAndView("redirect:/board/qnaList.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/board/qnaView.do", method= RequestMethod.GET)
	public ModelAndView qnaView(@RequestParam("qna_no") int qna_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		QnaVO qnaVO = qnaService.qnaView(qna_no);
		ModelAndView mav = new ModelAndView();
		
		session = request.getSession();
		
		memberVO = (MemberVO)session.getAttribute("member");
		int manager;
		
		if(memberVO != null) {
			 manager = memberVO.getMember_manager();
		}
		else {
			 manager = 1234;
		}

		mav.setViewName("/board/qnaView");
		mav.addObject("qnaVO", qnaVO);
		mav.addObject("manager", manager);
		// 조회수 증가
		qnaService.increaseHits(qna_no);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/board/qnaMod.do", method=RequestMethod.POST)
	public ModelAndView qnaMod(@RequestParam("qna_no") int qna_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		QnaVO qnaVO = qnaService.qnaMod(qna_no);
		ModelAndView mav = new ModelAndView("qnaMod");
		mav.addObject("qnaVO", qnaVO);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/qnaMod.do", method=RequestMethod.POST)
	public ModelAndView qnaModify(@ModelAttribute("qna_no") QnaVO qnaVO,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		qnaVO.getQna_no();
		qnaService.qnaModify(qnaVO);
		ModelAndView mav = new ModelAndView("redirect:/board/qnaList.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/board/qnaRemove.do", method= RequestMethod.POST)
	public ModelAndView qnaRemove(@RequestParam("qna_no") int qna_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		qnaService.qnaRemove(qna_no);
		ModelAndView mav = new ModelAndView("redirect:/board/qnaList.do");
		return mav;
	}
	
	
	// 답변 작성
	@Override
	@RequestMapping(value="/board/qnaReply.do", method=RequestMethod.POST)
	public ModelAndView qnaRe(@RequestParam("qna_no") int qna_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		QnaVO qnaVO = qnaService.qnaMod(qna_no);
		ModelAndView mav = new ModelAndView("qnaReply");
		mav.addObject("qnaVO", qnaVO);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/qnaReply.do", method=RequestMethod.POST)
	public ModelAndView qnaReply(@ModelAttribute("qnaVO") QnaVO qnaVO,
				HttpServletRequest request, HttpServletResponse response) throws Exception{
		qnaService.qnaReply(qnaVO);
		ModelAndView mav = new ModelAndView("redirect:/board/qnaList.do");
		return mav;
	}
	
	
}