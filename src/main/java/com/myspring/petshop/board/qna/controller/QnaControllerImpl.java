package com.myspring.petshop.board.qna.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
		session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		String member_nick = memberVO.getMember_nick();
		int member_manager = memberVO.getMember_manager();
		
		List qnaList = null;
		Pagination pagination = new Pagination();
		pagination.setListSize(10);
		if (member_manager == 1) {
			int listCnt = qnaService.qnaAllCnt();
			
			pagination.pageInfo(page, range, listCnt);
			
			qnaList = qnaService.listAllQna(pagination);
		}
		else {
			int listCnt = qnaService.qnaCnt(member_nick);
			
			pagination.pageInfo(page, range, listCnt);
			
			Map<String, Object> qnaMap = new HashMap<String, Object>();
			qnaMap.put("member_nick", member_nick);
			qnaMap.put("pagination", pagination);
			
			qnaList = qnaService.listQna(qnaMap);
		}
		
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
	
		int qnaMaxNo = qnaService.qnaMaxNo();

		qnaVO.setQna_no(qnaMaxNo);
		
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
		String member_nick = memberVO.getMember_nick();
		int member_manager = memberVO.getMember_manager();

		mav.setViewName("/board/qnaView");
		mav.addObject("qnaVO", qnaVO);
		mav.addObject("member_nick", member_nick);
		mav.addObject("member_manager", member_manager);
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
	
	@Override
	@RequestMapping(value="/board/qnaRemove2.do", method= RequestMethod.POST)
	public ModelAndView qnaRemove2(@RequestParam("qna_no") int qna_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		qnaService.qnaRemove2(qna_no);
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