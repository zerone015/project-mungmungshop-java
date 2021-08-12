package com.myspring.petshop.manager.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.product.service.ManagerProductService;
import com.myspring.petshop.product.vo.ProductVO;

@Controller
public class ManagerProductControllerImpl implements ManagerProductController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\mungmungshop\\image_repo";
	@Autowired
	private ManagerProductService managerService;
	
	
	@Override
	@RequestMapping(value="/manager/addProduct.do", method = RequestMethod.POST)
	public ModelAndView addProduct(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> map = new HashMap<String, Object>(); 
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
			System.out.println(name+value);
		}
		
		List fileList = upload(multipartRequest);
		String p_imageFileName = (String) fileList.get(0);
		String p_imageFileName2 = (String) fileList.get(1);
		map.put("p_imageFileName", p_imageFileName);
		map.put("p_imageFileName2", p_imageFileName2);
		managerService.addProduct(map);
		
		ModelAndView mav = new ModelAndView("redirect:/manager/managerProduct.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/managerProduct.do", method = RequestMethod.GET)
	public ModelAndView listProducts(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(value="sortBy", required=false, defaultValue="default") String sortBy,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView("managerProduct");
		
		int listCnt = managerService.productsCnt();
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		List<ProductVO> products;
		if(sortBy.equals("stock")) {
			products = managerService.fewStockProducts(pagination);
			mav.addObject("products", products);
		}
		else {
			products = managerService.listProducts(pagination);
			mav.addObject("products", products);
		}
		
		mav.addObject("pagination", pagination);
		mav.addObject("sortBy", sortBy);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/managerProductInfo.do", method = RequestMethod.GET)
	public ModelAndView getProduct(String p_code, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ProductVO product = managerService.getProduct(p_code);
		ModelAndView mav = new ModelAndView("managerProductInfo");
		mav.addObject("product", product);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/managerProductModify.do", method = RequestMethod.GET)
	public String getModifyProduct(@RequestParam("p_code") String p_code,
			HttpServletRequest request,HttpServletResponse response, Model model) throws Exception {
		
		ProductVO product = managerService.getModifyProduct(p_code);
		model.addAttribute("product", product);

		return "managerProductModify";	
	}
	
	@Override
	@RequestMapping(value="/manager/modifyProduct.do", method = RequestMethod.POST)
	public ResponseEntity modifyProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String, Object> map = new HashMap<String, Object>(); 
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			map.put(name, value);
			System.out.println(name+value);
		}
		
		List fileList = upload(multipartRequest);
		String p_imageFileName = (String) fileList.get(0);
		String p_imageFileName2 = (String) fileList.get(1);
		map.put("p_imageFileName", p_imageFileName);
		map.put("p_imageFileName2", p_imageFileName2);
		String p_code = multipartRequest.getParameter("p_code");
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			managerService.modifyProduct(map);
			message = "<script>";
			message += "alert('상품 수정을 완료하였습니다.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/manager/managerProductInfo.do?p_code=" + p_code + "';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류 발생. 다시 시도해주세요.');";
			message += "location.href='" + multipartRequest.getContextPath() + "/manager/managerProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value="/manager/removeProduct.do", method = RequestMethod.GET)
	public ResponseEntity removeProduct(@RequestParam("p_code") String p_code,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			managerService.removeProduct(p_code);
			message = "<script>";
			message += "alert('상품 삭제를 완료하였습니다.');";
			message += "location.href='" + request.getContextPath() + "/manager/managerProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
			message = "<script>";
			message += "alert('오류 발생. 다시 시도해주세요.');";
			message += "location.href='" + request.getContextPath() + "/manager/managerProduct.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
			
		return resEnt;
	}
	
	
	@Override
	@RequestMapping(value="/manager/getSearchProducts.do", method = RequestMethod.GET)
	public ModelAndView getSearchProducts(@RequestParam("searchBy") String searchBy,
			@RequestParam("searchContents") String searchContents,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range ) throws Exception {
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchBy", searchBy);
		searchMap.put("searchContents", searchContents);
		
		int	listCnt = managerService.searchProductsCnt(searchMap);
	
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		searchMap.put("pagination", pagination);
		
		List products = managerService.getSearchProducts(searchMap);
		
		ModelAndView mav = new ModelAndView("managerProduct");
		mav.addObject("products", products);
		mav.addObject("pagination", pagination);
		mav.addObject("searchBy", searchBy);
		mav.addObject("searchContents", searchContents);
		
		return mav;
	}
	
	private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		List<String> fileList= new ArrayList<String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			String imageFileName=mFile.getOriginalFilename();
			fileList.add(imageFileName);
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
		return fileList;
		}
	
}