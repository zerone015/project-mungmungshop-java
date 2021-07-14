package com.myspring.petshop.cart.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.cart.service.CartService;
import com.myspring.petshop.cart.vo.CartVO;
import com.myspring.petshop.member.vo.MemberVO;


@Controller
public class CartControllerImpl implements CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;
	
	@ResponseBody
	@RequestMapping(value="/cart/addProductsInCart.do", method = RequestMethod.POST)
	public String addProductsInCart(@ModelAttribute("cart") CartVO cart,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		int member_num = memberVO.getMember_Num();
		cartVO.setMember_num(member_num);
		cartVO.setP_code(cart.getP_code());
		cartVO.setCart_quantity(cart.getCart_quantity());
		
		boolean isAreadyExisted = cartService.findCartProducts(cartVO);
		
		if(isAreadyExisted == true) {
			return "already_existed";
		}else {
			cartService.addProductsInCart(cartVO);
			return "add_success";
		}
	}
	
	@RequestMapping(value="/cart/myCartList.do", method = RequestMethod.GET)
	public ModelAndView getMyCartList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView("cart");
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		int member_num = memberVO.getMember_Num();
		cartVO.setMember_num(member_num);
		Map<String, List> cartMap = cartService.getMyCartList(cartVO);
		session.setAttribute("cartMap", cartMap);
		
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/cart/modifyCartQty.do", method = RequestMethod.POST)
	public String modifyCartQty(@RequestParam("p_code") String p_code, 
								@RequestParam("cart_quantity") int cart_quantity,
								@RequestParam("cartQty_btnVal") String cartQty_btnVal,
				HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		int member_num = memberVO.getMember_Num();
		cartVO.setMember_num(member_num);
		cartVO.setP_code(p_code);
		cartVO.setCart_quantity(cart_quantity);
		
		System.out.println("p_code = "+p_code+"cart_quantity = "+cart_quantity+"cartQty_btnVal = "+cartQty_btnVal);
		
		Map<String, Object> cartMap = new HashMap<String, Object>();
		cartMap.put("cartVO", cartVO);
		cartMap.put("cartQty_btnVal", cartQty_btnVal);
		
		
		boolean result = cartService.modifyCartQty(cartMap);
		
		if(result == true) {
			return "modify_success";
		}else {
			return "modify_failed";
		}
		
	}
	
}
