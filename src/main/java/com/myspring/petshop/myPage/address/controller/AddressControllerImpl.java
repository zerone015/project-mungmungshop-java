package com.myspring.petshop.myPage.address.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.myPage.address.service.AddressService;
import com.myspring.petshop.myPage.address.vo.AddressVO;

@Controller("addressController")
@EnableAspectJAutoProxy
public class AddressControllerImpl implements AddressController {


	@Autowired
	private AddressService addressService;
	@Autowired
	private AddressVO addressVO;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value = "/address/addAddress.do",  method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView addAddress(@ModelAttribute("address") AddressVO address, RedirectAttributes rAttr,
			HttpServletRequest request,HttpServletResponse response) throws Exception {
		 	request.setCharacterEncoding("utf-8");
			
		 	HttpSession session = request.getSession();
			memberVO = (MemberVO) session.getAttribute("member");
			int member_num = memberVO.getMember_num();
		 	
			int addressCnt = addressService.getAddressCnt(member_num);
			System.out.println(addressCnt);
		
			if(addressCnt < 10) {
				address.setMember_num(member_num);
				addressService.addAddress(address);
			}
			
			else {
				rAttr.addAttribute("result", "addFailed");	
			}
			
			return new ModelAndView("redirect:/address/addressList.do");
	}
	
	@Override
	@RequestMapping(value = "/address/addressList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getAddressList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		int member_num = memberVO.getMember_num();
		
		List<AddressVO> addressList = addressService.getAddressList(member_num);
		
		ModelAndView mav = new ModelAndView("address");
		mav.addObject("addressList", addressList);
		
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/myPage/modAddress.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView modAddress(@RequestParam("address_num") int address_num,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		addressVO = addressService.getModAddress(address_num);
		ModelAndView mav = new ModelAndView("modAddress");
		mav.addObject("addressVO", addressVO);
				
		return mav; 			
	}
	
	@Override
	@RequestMapping(value = "/addressWrite.do", method = RequestMethod.GET)
	public String addressWrite() throws Exception {
		return "addressWrite";
	}
	
	 
	@Override
	@RequestMapping(value="/myPage/modifyAddress.do", method=RequestMethod.POST)
	public ModelAndView modifyAddress(@ModelAttribute("address") AddressVO address,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		addressService.modifyAddress(address);
		ModelAndView mav = new ModelAndView("redirect:/address/addressList.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/myPage/removeAddress.do",method=RequestMethod.GET)
	public ModelAndView removeAddress(@ModelAttribute("address") AddressVO address,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		addressService.removeAddress(address);
		ModelAndView mav = new ModelAndView("redirect:/address/addressList.do");
		
		return mav;
	}
}
