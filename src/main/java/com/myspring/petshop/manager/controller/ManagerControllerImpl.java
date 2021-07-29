package com.myspring.petshop.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.service.ManagerService;
import com.myspring.petshop.product.vo.ProductVO;

@Controller
public class ManagerControllerImpl implements ManagerController {
	@Autowired
	private ManagerService managerService;

	
	@Override
	@RequestMapping(value="/manager/addProduct.do", method = RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") ProductVO product,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		managerService.addProduct(product);
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
	public ModelAndView modifyProduct(@ModelAttribute("product") ProductVO product,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		managerService.modifyProduct(product);
		ModelAndView mav = new ModelAndView("redirect:/manager/managerProduct.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/removeProduct.do", method = RequestMethod.GET)
	public ModelAndView removeProduct(@RequestParam("p_code") String p_code,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		managerService.removeProduct(p_code);
		ModelAndView mav = new ModelAndView("redirect:/manager/managerProduct.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/manager/getMembersList.do", method = RequestMethod.GET)
	public ModelAndView getMembersList(@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {
		int listCnt = managerService.membersCnt();
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		List members = managerService.getMembersList(pagination);
		
		ModelAndView mav = new ModelAndView("managerMember");
		mav.addObject("pagination", pagination);
		mav.addObject("members", members);
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/manager/removeMembers.do", method = RequestMethod.POST)
	public String removeMembers(@RequestParam("member_num") int member_num) throws Exception {
		boolean result = managerService.removeMembers(member_num);
	
		if (result == true) {
			return "remove_success";
		}
		else {
			return "remove_failed";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="/manager/modMemberGrant.do", method = RequestMethod.POST)
	public String modMemberGrant(@RequestParam("member_num") int member_num) throws Exception {
		boolean result = managerService.modMemberGrant(member_num);
		
		if (result == true) {
			return "grant_success";
		}
		else {
			return "grant_failed";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/manager/modMemberRevoke.do", method = RequestMethod.POST)
	public String modMemberRevoke(@RequestParam("member_num") int member_num) throws Exception {
		boolean result = managerService.modMemberRevoke(member_num);
		
		if (result == true) {
			return "revoke_success";
		}
		else {
			return "revoke_failed";
		}
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
	
	@Override
	@RequestMapping(value="/manager/getSearchMembers.do", method = RequestMethod.GET)
	public ModelAndView getSearchMembers(@RequestParam("searchBy") String searchBy,
			@RequestParam("searchContents") String searchContents,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range ) throws Exception {
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchBy", searchBy);
		searchMap.put("searchContents", searchContents);
		
		int	listCnt = managerService.searchMembersCnt(searchMap);
	
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		searchMap.put("pagination", pagination);
		
		List members = managerService.getSearchMembers(searchMap);
		
		ModelAndView mav = new ModelAndView("managerMember");
		mav.addObject("members", members);
		mav.addObject("pagination", pagination);
		mav.addObject("searchBy", searchBy);
		mav.addObject("searchContents", searchContents);
		
		return mav;
	}
}
