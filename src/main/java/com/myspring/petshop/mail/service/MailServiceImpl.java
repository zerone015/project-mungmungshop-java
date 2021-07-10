package com.myspring.petshop.mail.service;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.myspring.petshop.mail.dao.MailDAO;
import com.myspring.petshop.member.vo.MemberVO;

@Service("mailService")
public class MailServiceImpl implements MailService {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SimpleMailMessage preConfiguredMessage;
	@Autowired
	private MailDAO mailDAO;

	@Override
	public String getEmail(MemberVO member) throws Exception {
		
		return mailDAO.selectEmail(member);
	}
	
	@Override
	public String getPw(MemberVO member) throws Exception {
		
		return mailDAO.selectPw(member);
	}
	
	@Override
	public int getEmailCnt(String email) throws Exception {
		
		return mailDAO.selectEmailCnt(email);
	}
}

	
/*
	@Async
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setFrom("mungmungshop12@gmail.com", "뭉뭉샵");
			messageHelper.setText(body,true);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Async
	public void sendPreConfiguredMail(String message) {
		SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
		mailMessage.setText(message);
		mailSender.send(mailMessage);
	}
} */

/*
 @Service("mailService")
public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SimpleMailMessage preConfiguredMessage;
	
	@Async //비동기 처리
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			//messageHelper.setCc("zzzzzz@naver.com");
			messageHelper.setFrom("송신자 메일@naver.com", "홍길동");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);		
			messageHelper.setText(body);
			mailSender.send(message);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Async  //비동기 처리  // mail-context.xml에 preConfiguredMessage빈에 미리 설정한것으로 보냄
	public void sendPreConfiguredMail(String message) {
		SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
		mailMessage.setText(message);
		mailSender.send(mailMessage);
	}

}
*/
