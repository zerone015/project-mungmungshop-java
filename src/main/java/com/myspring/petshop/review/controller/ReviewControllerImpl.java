package com.myspring.petshop.review.controller;

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.board.event.controller.EventControllerImpl;
import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.product.service.ProductService;
import com.myspring.petshop.product.vo.ProductVO;
import com.myspring.petshop.review.service.ReviewService;
import com.myspring.petshop.review.vo.ReviewVO;

@Controller
public class ReviewControllerImpl implements ReviewController {
	
	
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private ProductVO productVO;
	@Autowired
	private ReviewVO reviewVO;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ProductService productService;
	
	
	private static final String CURR_IMAGE_REPO_PATH = "C:\\mungmungshop\\image_repo";
	private static final Logger logger = LoggerFactory.getLogger(EventControllerImpl.class);
	
	@RequestMapping(value = "/reviewWrite.do", method = RequestMethod.GET)
	public String reviewWriteForm(Locale locale, Model model) {
		
		
		return "reviewWrite";
	}
	
	
	@Override
	@RequestMapping(value = "/myPage/reviewList.do", method = RequestMethod.GET)
	public ModelAndView review(@ModelAttribute("reviewVO") ReviewVO reviewVO,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView("reviewList");
		
		session = request.getSession();
		
		memberVO = (MemberVO)session.getAttribute("member");
		
		// 게시글 총 개수
		int listCnt = reviewService.myReviewCnt();
		
		Pagination pagination = new Pagination();
		pagination.setListSize(10);
		pagination.pageInfo(page, range, listCnt);
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		String member_nick = memberVO.getMember_nick();
		
		info.put("pagination", pagination);
		info.put("member_nick", member_nick);
		
		List reviewList = reviewService.listMyReview(info);
		
		mav.addObject("reviewList", reviewList);
		mav.addObject("info", info);
		
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/reviewWriteForm.do", method = RequestMethod.GET)
	public ModelAndView reviewWriteForm(@RequestParam("p_code") String p_code,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		
		ProductVO product = productService.getProduct(p_code);
		String member_nick = memberVO.getMember_nick();
		
		ModelAndView mav = new ModelAndView("reviewWrite");
		
		mav.addObject("product", product);
		mav.addObject("member_nick", member_nick);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/reviewWrite.do", method = RequestMethod.POST)
	public ModelAndView reviewWrite(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		
		session = multipartRequest.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		
		multipartRequest.setCharacterEncoding("utf-8");
		
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
			System.out.println(name+value);
		}
		
		String review_imageFileName = upload(multipartRequest);
		map.put("review_imageFileName", review_imageFileName);
		reviewService.reviewWrite(map);

		ModelAndView mav = new ModelAndView("reviewList");
		
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
