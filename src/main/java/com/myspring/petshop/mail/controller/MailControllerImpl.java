package com.myspring.petshop.mail.controller;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.petshop.mail.service.MailServiceImpl;
import com.myspring.petshop.member.controller.MemberControllerImpl;
import com.myspring.petshop.member.vo.MemberVO;


@Controller("mailController")
@EnableAsync // 비동기 처리 해주는 @Async 애너테이션을 인식할 수 있게 해주는 애너테이션.
public class MailControllerImpl implements MailController {
	@Autowired
	private MailServiceImpl mailService;
	@Autowired
	private JavaMailSender mailSender;
	
	private static final Logger logger = LoggerFactory.getLogger(MailControllerImpl.class);
	
	@Override
	@RequestMapping(value="/mail/sendMailByJoin.do", method=RequestMethod.GET)
	@ResponseBody
	public int sendMailByJoin(String email) throws Exception {
		
		int emailCnt = mailService.getEmailCnt(email);
		
		if(emailCnt > 3) {
			int checkNum = 0;
			
			return checkNum;
		}else {
		
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
		
			String setFrom = "mungmungshop12@gmail.com";
			String setFromName = "뭉뭉샵";
			String toMail = email;
			String title = "회원가입 인증 이메일 입니다.";
			String content =
					"홈페이지를 방문해주셔서 감사합니다." +
							"<br><br>" +
							"인증 번호는 " + checkNum + " 입니다." +
							"<br><br>" +
							"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		
		
			try {		
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom,setFromName);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				mailSender.send(message);
		    }catch(Exception e) {
			    logger.error("Error:join_mailCheck send error");
		    }
			return checkNum;
		}
	}
	
	@Override
	@RequestMapping(value="/mail/findPwCheck.do", method = RequestMethod.POST)
	public ModelAndView sendMailByfindPw(@ModelAttribute("member")MemberVO member,RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String email = mailService.getEmail(member);
		ModelAndView mav = new ModelAndView();
		if(email != null && email != "") {
			String id = member.getMember_id();
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;
			String setFrom = "mungmungshop12@gmail.com";
			String setFromName = "뭉뭉샵";
			String toMail = email;
			String title = "비밀번호 찾기 인증 이메일 입니다.";
			String content =
					"홈페이지를 방문해주셔서 감사합니다." +
					"<br><br>" +
					"인증 번호는 " + checkNum + " 입니다." +
					"<br><br>" +
					"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
			try {		
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
				helper.setFrom(setFrom,setFromName);
				helper.setTo(toMail);
				helper.setSubject(title);
				helper.setText(content,true);
				mailSender.send(message);
			} catch(Exception e) {
				logger.error("Error:findPw_mailCheck send error");
			}
			mav.setViewName("findPwCheck");
			mav.addObject("passcode", checkNum);
			mav.addObject("id", id);
			mav.addObject("email", email);
		}else {
			rAttr.addAttribute("email", "notExists");
			mav.setViewName("redirect:/findPw.do");
		}
		
		return mav;
	}

}
	
/*	
	@RequestMapping(value="/sendMail.do", method = RequestMethod.GET)
	public void sendSimpleMail(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		request.setCharacterEncoding("utf-8");	// 클라이언트의 요청 정보가 저장된 request 객체의 한글 인코딩을 위해 utf-8설정
		response.setContentType("text/html;charset=utf-8");	//서버에서 클라이언트에 응답할 한글 인코딩을 위해 utf-8 설정
		PrintWriter out = response.getWriter(); //텍스트 형식을 response 내장 객체로 클라이언트에 응답해 보낼 수 있는 스트림을 생성/ 
		StringBuffer sb = new StringBuffer(); //java.lang.StringBuffer로 훨씬 효율적이고 빠른 처리속도로 문자열을 추가합니다.(String 클래스 객체는 + 연산자를 이용해 문자열을 결합하면 계속 새로운 객체를 생성하여 문자열을 많이 결합하면 할수록 공간의 낭비뿐만 아니라 속도 또한 매우 느려지게된다)불변 클래스=String,가변클래스=StringBuffer
		sb.append("<html><body>");
		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>");
		sb.append("<h1>"+"제품소개"+"<h1><br>");
		sb.append("신간 도서를 소개합니다.<br><br>");
		sb.append("<a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788956746425&orderClick=LAG&Kc=#N'>");
		sb.append("<img src='http://image.kyobobook.co.kr/images/book/xlarge/425/x9788956746425.jpg'/></a><br>");
		sb.append("</a>");
		sb.append("<a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788956746425&orderClick=LAG&Kc=#N'>상품보기</a>");
		sb.append("</body></html>");		//여기까지 문자열을 효율적으로 연산한다.
		String str=sb.toString();			//효율적으로 연산한 후 toString() 메소드를 이용해 문자열을 할당
		mailService.sendMail("수신자@naver.com", "신상품을 소개합니다", str);		
		
		out.print("메일을 보냈습니다!!");
	} */

/*
@Controller
@EnableAsync  //비동기처리 @Async를 사용할 수 있게 해주는 녀석 (@Async는 public 메소드에만 적용해야한다,같은 클래스안에서의 호출은 작동하지 않는다.)
public class MailController {
	@Autowired
	private MailService mailService;
	
	@RequestMapping(value = "/sendMail.do", method = RequestMethod.GET)
	public void sendSimpleMail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		mailService.sendMail("수신자메일@naver.com","테스트 메일","안녕하세요. 보낸 메일 내용입니다.");
		mailService.sendPreConfiguredMail("테스트 메일입니다.");
		out.print("메일을 보냈습니다!!");
	}
}				*/

