package com.myspring.petshop.board.event.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.board.event.service.EventService;
import com.myspring.petshop.board.event.vo.EventVO;
import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.member.vo.MemberVO;



@Controller("eventController")
@EnableAspectJAutoProxy
public class EventControllerImpl implements EventController {
	@Autowired
	private EventService eventService;
	@Autowired
	private EventVO eventVO;
	@Autowired
	private MemberVO memberVO; 
	@Autowired
	private HttpSession session;

	private static final Logger logger = LoggerFactory.getLogger(EventControllerImpl.class);
	private static final String CURR_IMAGE_REPO_PATH = "C:\\mungmungshop\\image_repo";
	
	@Override
	@RequestMapping(value = "/board/eventList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView eventList(@RequestParam(required = false, defaultValue = "1") int page,
								  @RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		
		
		ModelAndView mav = new ModelAndView("/board/eventList");
		
		session = request.getSession();
		
		memberVO = (MemberVO)session.getAttribute("member");
		int manager;
		if(memberVO != null) {
			 manager = memberVO.getMember_manager();
		}
		else {
			 manager = 1234;
		}
		
		int listCnt = eventService.eventCnt();
		
		Pagination pagination = new Pagination();
		pagination.setListSize(10);
		pagination.pageInfo(page, range, listCnt);
		
		List eventList = eventService.listEvent(pagination);
		
		mav.addObject("pagination", pagination);
		mav.addObject("eventList", eventList);
		mav.addObject("manager", manager);
		
		return mav;
	}
	
	@RequestMapping(value = "/board/eventWrite.do", method = RequestMethod.GET)
	public String eventWrite(HttpSession session, Model model) throws Exception {
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String member_nick = memberVO.getMember_nick();
		
		model.addAttribute("member_nick", member_nick);
		
		return "eventWrite";
	}
	
	@Override
	@RequestMapping(value="/eventWrite.do", method=RequestMethod.POST)
	public ModelAndView eventWrite(@ModelAttribute("event") EventVO event, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response)throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
	
		String event_image_filename = upload(multipartRequest);
		event.setEvent_image_FileName(event_image_filename);
		
		int result=0;
		result = eventService.eventWrite(event);

		ModelAndView mav = new ModelAndView("redirect:/board/eventList.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/board/eventView.do", method= RequestMethod.GET)
	public ModelAndView eventView(@RequestParam("event_no") int event_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		int member_manager = 0;
		if(memberVO != null) {
			member_manager = memberVO.getMember_manager();
		}
		
		
		EventVO eventVO = eventService.viewEvent(event_no);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/eventView");
		mav.addObject("event", eventVO);
		mav.addObject("member_manager", member_manager);
		
		eventService.increaseHits(event_no);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/board/eventMod.do", method=RequestMethod.POST)
	public ModelAndView eventMod(@RequestParam("event_no") int event_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		EventVO eventVO = eventService.eventMod(event_no);
		ModelAndView mav = new ModelAndView("eventMod");
		mav.addObject("eventVO", eventVO);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/eventMod.do", method=RequestMethod.POST)
	public ModelAndView eventModify(@ModelAttribute("event") EventVO event,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");

		String event_image_filename = upload(multipartRequest);
		event.setEvent_image_FileName(event_image_filename);
		
		eventService.eventModify(event);
		
		ModelAndView mav = new ModelAndView("redirect:/board/eventList.do");
		
		return mav;
	}
	

	@Override
	@RequestMapping(value="/board/eventRemove.do", method=RequestMethod.POST)
	public ModelAndView eventRemove(@RequestParam("event_no") int event_no, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		eventService.eventRemove(event_no);
		ModelAndView mav = new ModelAndView("redirect:/board/eventList.do");
		return mav;
	}
	
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		String imageFileName = null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName = mFile.getOriginalFilename();//
			File file = new File(CURR_IMAGE_REPO_PATH +"\\"+ fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					if(file.getParentFile().mkdirs()) { 
						file.createNewFile();
					}
					mFile.transferTo(new File(CURR_IMAGE_REPO_PATH +"\\"+ imageFileName));
					}
				}
			}
		return imageFileName;
	}
}