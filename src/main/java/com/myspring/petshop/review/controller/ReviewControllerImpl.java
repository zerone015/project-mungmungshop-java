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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@RequestMapping(value = "/myPage/reviewList.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView review(
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView("reviewList");
		
		session = request.getSession();
		
		memberVO = (MemberVO)session.getAttribute("member");
		
		// �Խñ� �� ����
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
	@RequestMapping(value = "/myPage/removeReview.do", method = RequestMethod.GET)
	public ResponseEntity review(@RequestParam("review_num") int review_num,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			reviewService.removeReview(review_num);
			message = "<script>";
			message += "alert('후기를 삭제했습니다.');";
			message += "location.href='" + request.getContextPath() + "/myPage/reviewList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류 발생. 다시 시도해주세요.');";
			message += "location.href='" + request.getContextPath() + "/myPage/reviewList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value = "/reviewWriteForm.do", method = RequestMethod.GET)
	public ModelAndView reviewWriteForm(@RequestParam("p_code") String p_code,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		
		String member_nick = memberVO.getMember_nick();
		
		ProductVO product = productService.getProduct(p_code);
		
		mav.setViewName("reviewWrite");
		mav.addObject("product", product);			
		mav.addObject("member_nick", member_nick);
			
		return mav;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/reviewWrite.do", method = RequestMethod.POST)
	public int reviewWrite(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		
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
		
		int result = reviewService.getReviewCnt(map);
		
		if(result == 0) {
			String review_imageFileName = upload(multipartRequest);
			map.put("review_imageFileName", review_imageFileName);
			reviewService.reviewWrite(map);	
		}
		
		return result;
	}
	
	@Override
	@RequestMapping(value = "/reviewModForm.do", method = RequestMethod.GET)
	public ModelAndView reviewModForm(@RequestParam("review_num") int review_num,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		
		ReviewVO reviewVO = reviewService.getReview(review_num);
		
		ProductVO productVO = productService.getProduct(reviewVO.getP_code());
		
		ModelAndView mav = new ModelAndView("review");
		
		mav.addObject("reviewVO", reviewVO);
		mav.addObject("productVO", productVO);
		
		return mav;
	}
	
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/reviewMod.do", method = RequestMethod.POST)
	public String reviewMod(
			@RequestParam("review_num") int review_num,
			MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		
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

		reviewService.reviewMod(map);

		
		return "1";
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
