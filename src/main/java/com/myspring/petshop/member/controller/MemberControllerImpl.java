package com.myspring.petshop.member.controller;

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
	/* NaverLoginBO */
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
			
			if(!referer.equals("http://localhost:8080/petshop/login.do")) {
				session.setAttribute("referer", referer);
			}		
		}
		else {
			session.removeAttribute("interceptor");
		}
		
		  /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);
		
		return "login";
	}
		
	@Override
	@RequestMapping(value="/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
			 		RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
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
		    //로그인 사용자 정보를 읽어온다.
		    apiResult = naverLoginBO.getUserProfile(oauthToken);
		    
		    
		 // 내가 원하는 정보 (이름)만 JSON타입에서 String타입으로 바꿔 가져오기 위한 작업 
		    JSONParser parser = new JSONParser(); 
		    Object obj = null; 
		    try { 
		    	obj = parser.parse(apiResult); 
		    }catch (ParseException e){ 
		    	e.printStackTrace(); 
		    } 
		    JSONObject jsonobj = (JSONObject) obj; 
		    JSONObject response = (JSONObject) jsonobj.get("response"); 
		    String member_id = (String) response.get("id");
		    String member_name = (String) response.get("name"); 
		    String member_email = (String) response.get("email"); 
		    String member_phone = (String) response.get("mobile");
		    	    
		    memberVO = memberService.getNaverMember(member_id);
		    
		    if (memberVO == null) {
		    	MemberVO memberVO = new MemberVO();
		    	memberVO.setMember_id(member_id);
		    	memberVO.setMember_name(member_name);
		    	memberVO.setMember_email(member_email);
		    	memberVO.setMember_phone(member_phone);
		    	memberVO = memberService.addNaverMember(memberVO);
		    	session.setAttribute("member", memberVO);
		    }
		    else {
		    	session.setAttribute("member", memberVO);
		    }
	
		return mav;
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
		request.setCharacterEncoding("utf-8");
		List memberId = memberService.findId(member);
		ModelAndView mav = new ModelAndView();
		if (memberId.size() == 0) {
			rAttr.addAttribute("memberId", "notExists");
			mav.setViewName("redirect:/findId.do");
		}else {
			mav.addObject("memberId", memberId);
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