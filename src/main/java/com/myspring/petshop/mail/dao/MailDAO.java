package com.myspring.petshop.mail.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.myspring.petshop.member.vo.MemberVO;

public interface MailDAO{
	public String selectEmail(MemberVO member) throws Exception;
	public String selectPw(MemberVO member) throws Exception;
	public int selectEmailCnt(String email) throws Exception;
}