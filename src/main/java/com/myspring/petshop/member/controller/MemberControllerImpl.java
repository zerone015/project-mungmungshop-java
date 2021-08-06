package com.myspring.petshop.member.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.expression.ParseException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.myspring.petshop.member.kakao.KakaoController;
import com.myspring.petshop.member.naver.NaverLoginBO;
import com.myspring.petshop.member.service.MemberService;
import com.myspring.petshop.member.vo.MemberVO;

@Controller("memberController")
@EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController{
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private BCryptPasswordEncoder passEncoder;
	@Autowired
	private KakaoController kakaoController;
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	
	@Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
	
	@Override
	@ResponseBody
	@RequestMapping(value="/member/idChk", method = RequestMethod.POST)
	public int getIdCnt(MemberVO vo) throws Exception {
		int result = memberService.getIdCnt(vo);
		return result;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value="/member/nickChk", method = RequestMethod.POST)
	public int getNickNameCnt(MemberVO vo) throws Exception {
		int result = memberService.getNickNameCnt(vo);
		return result;
	}
	
	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession();
		String interceptor = (String) session.getAttribute("interceptor");
		
		if(interceptor == null) {
			String referer = request.getHeader("Referer");	
			if(referer == null) {
				referer = "null";
			}
			
			if(
				!referer.equals("http://localhost:8080/petshop/login.do") && 
				!referer.equals("http://localhost:8080/petshop/member/joinAgree.do") &&
				!referer.equals("http://localhost:8080/petshop/joinMember.do") &&
				!referer.equals("http://localhost:8080/petshop/joinWelcome.do") &&
				!referer.equals("http://localhost:8080/petshop/findId.do") &&
				!referer.equals("http://localhost:8080/petshop/member/resultId.do") &&
				!referer.equals("http://localhost:8080/petshop/findPw.do") &&
				!referer.equals("http://localhost:8080/petshop/mail/findPwCheck.do") &&
				!referer.equals("http://localhost:8080/petshop/member/changePw.do") &&
				!referer.equals("http://localhost:8080/petshop/changePwResult.do") &&
				!referer.equals("http://localhost:8080/petshop/payment/getPaymentPage.do") &&
				!referer.equals("http://localhost:8080/petshop/payment/getPaymentResult.do") &&
				!referer.equals("http://localhost:8080/petshop/myPage/infoCertify.do") &&
				!referer.equals("http://localhost:8080/petshop/myPage/infoModify.do") &&
				!referer.equals("http://localhost:8080/petshop/myPage/quit.do") &&
				!referer.equals("http://localhost:8080/petshop/myPage/pwCertify.do") &&
				!referer.equals("http://localhost:8080/petshop/myPage/newPW.do") &&
				!referer.equals("http://localhost:8080/petshop/address/addressList.do") &&
				!referer.equals("http://localhost:8080/petshop/myPage/addOrderRefund.do") &&
				!referer.equals("http://localhost:8080/petshop/myPage/getRefundPage.do")
				){
					
				session.setAttribute("referer", referer);
			}		
		}
		else {
			session.removeAttribute("interceptor");
		}
		
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		/* String kakaoAuthUrl = KakaoController.getAuthorizationUrl(session); */
      
        model.addAttribute("naver_url", naverAuthUrl);
		/* model.addAttribute("kakao_url", kakaoAuthUrl); */
		
        return "login";
	}
		
	@Override
	@RequestMapping(value="/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
			 		RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member.getMember_id());
		boolean passMatch = false;
		
		if(memberVO != null) {
			passMatch = passEncoder.matches(member.getMember_pw(), memberVO.getMember_pw());
		}
		
		if(memberVO != null && passMatch) {
			String remember_userId = request.getParameter("remember_userId");
			Cookie cookie = new Cookie("rememberId", memberVO.getMember_id());
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			cookie.setPath("/");
			
			if(remember_userId == null) {
				cookie.setMaxAge(0);
			} 
			else {	
				cookie.setMaxAge(60*60*24*30);
			}
			response.addCookie(cookie);
			
			memberService.modLoginDate(memberVO.getMember_num());
			
			String referer = (String) session.getAttribute("referer");
			mav.setViewName("redirect:"+referer);
		
			session.removeAttribute("referer");
			
		}
		
		else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/login.do");
			
		}
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/naverLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView naverLogin(@RequestParam String code, @RequestParam String state,
						HttpServletRequest request, HttpSession session) throws Exception {
			ModelAndView mav = new ModelAndView("redirect:/main.do");
		    OAuth2AccessToken oauthToken;
		    oauthToken = naverLoginBO.getAccessToken(session, code, state);
		    //占싸깍옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占싻억옙쨈占�.
		    apiResult = naverLoginBO.getUserProfile(oauthToken);
		    
		    
		 // 占쏙옙占쏙옙 占쏙옙占싹댐옙 占쏙옙占쏙옙 (占싱몌옙)占쏙옙 JSON타占쌉울옙占쏙옙 String타占쏙옙占쏙옙占쏙옙 占쌕뀐옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쌜억옙 
		    JSONParser parser = new JSONParser(); 
		    Object obj = null; 
		    try { 
		    	obj = parser.parse(apiResult); 
		    }catch (ParseException e){ 
		    	e.printStackTrace(); 
		    } 
		    JSONObject jsonobj = (JSONObject) obj; 
		    JSONObject response = (JSONObject) jsonobj.get("response"); 
		    String id = (String) response.get("id");
		    String member_id = "mungmungshopNaverID "+id;
		    String member_name = (String) response.get("name"); 
		    String member_email = (String) response.get("email"); 
		    String member_phone = (String) response.get("mobile");
		    
		    memberVO = memberService.login(member_id);
		    
		    if (memberVO == null) {
		    	MemberVO member = new MemberVO();
		    	member.setMember_id(member_id);
		    	member.setMember_pw("null");
		    	member.setMember_name(member_name);
		    	member.setMember_email(member_email);
		    	member.setMember_phone(member_phone);
		    	member.setMember_nick(member_name);
		    	member.setMember_type("네이버");
		    	memberService.addMember(member);
		    	member = memberService.login(member_id);
		    	session.setAttribute("member", member);
		    	session.setAttribute("isLogOn", true);
		    }
		    else {
		    	session.setAttribute("member", memberVO);
		    	session.setAttribute("isLogOn", true);
		    }
	
		return mav;
	}
	
	@RequestMapping(value = "/member/kakaoLogin.do", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST }) 
	public String oauthKakao(@RequestParam(value = "code", required = false) String code, Model model, HttpSession session) throws Exception {

		String access_Token = kakaoController.getAccessToken(code);    
		HashMap<String, Object> userInfo = kakaoController.getUserInfo(access_Token);
		String member_id = (String) userInfo.get("member_id");
		String member_nick = (String) userInfo.get("member_nick");
		String member_email = (String) userInfo.get("member_email");
		
		memberVO = memberService.login(member_id);
		
		if(memberVO == null) {
			MemberVO member = new MemberVO();
			member.setMember_id(member_id);
			member.setMember_pw("null");
			member.setMember_name(member_nick);
			member.setMember_email(member_email);
			member.setMember_phone("null");
			member.setMember_nick(member_nick);
			member.setMember_type("카카오");
			memberService.addMember(member);
			member = memberService.login(member_id);
			session.setAttribute("member", member);
	    	session.setAttribute("isLogOn", true);
		}
		else {
	    	session.setAttribute("member", memberVO);
	    	session.setAttribute("isLogOn", true);
	    }
		JSONObject kakaoInfo =  new JSONObject(userInfo);
		model.addAttribute("kakaoInfo", kakaoInfo);
    
		return "redirect:/main.do";
	}
	
	@Override
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session=request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/joinAgree.do", method=RequestMethod.GET)
	public String joinAgree(HttpServletRequest request, HttpServletResponse response) throws Exception{
	

		return "/member/joinAgree";
	}
	
	@Override
	@RequestMapping(value="/member/addMember.do", method=RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member")MemberVO member, HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		
		String inputPass = member.getMember_pw();
		String pass = passEncoder.encode(inputPass);
		member.setMember_pw(pass);
		member.setMember_type("일반");
		memberService.addMember(member);
		
		ModelAndView mav = new ModelAndView("redirect:/member/joinWelcome.do");
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/joinWelcome.do", method=RequestMethod.GET)
	public String joinWelcome(HttpServletRequest request, HttpServletResponse response) throws Exception{


		return "/member/joinWelcome";
	}
	
	@Override
	@RequestMapping(value="/member/resultId.do", method = RequestMethod.POST)
	public ModelAndView findId(@ModelAttribute("member")MemberVO member,RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<MemberVO> memberList = memberService.findId(member);
		
		for(int i=0; i<memberList.size(); i++ ) {
			MemberVO memberVO = (MemberVO) memberList.get(i);
			if(!memberVO.getMember_type().equals("일반")) {
				if(memberVO.getMember_type().equals("카카오")) {
					memberVO.setMember_id("카카오 계정");
				}
				else {
					memberVO.setMember_id("네이버 계정");
				}
				memberList.remove(i);
				memberList.add(i, memberVO);
			}
		}
			
		ModelAndView mav = new ModelAndView();
		if (memberList.size() == 0) {
			rAttr.addAttribute("memberId", "notExists");
			mav.setViewName("redirect:/findId.do");
		}else {
			mav.addObject("memberList", memberList);
			mav.setViewName("resultId");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/changePw.do", method = RequestMethod.POST)
	public ModelAndView changePwView(@RequestParam("member_id") String id,
									 @RequestParam("member_email") String email,
							HttpServletRequest request,HttpServletResponse response)throws Exception {
		ModelAndView mav = new ModelAndView("changePw");
		mav.addObject("id", id);
		mav.addObject("email", email);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/member/updatePw.do", method = RequestMethod.POST)
	public ModelAndView changePw(@ModelAttribute("member")MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response)throws Exception {
		String inputPass = member.getMember_pw();
		String pass = passEncoder.encode(inputPass);
		member.setMember_pw(pass);
		
		memberService.changePw(member);
		
		return new ModelAndView("redirect:/changePwResult.do");
	}
}