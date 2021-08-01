package com.myspring.petshop.myPage.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.myPage.member.dao.MyPageMemberDAO;

@Service
public class MyPageMemberServiceImpl implements MyPageMemberService {
	@Autowired
	private MyPageMemberDAO myPageMemberDAO;
	
	@Override
	public void modPw(MemberVO memberVO) throws Exception {
		myPageMemberDAO.updatePw(memberVO);
	}
	
	@Override
	public void modifyInfo(MemberVO member) throws Exception {
		myPageMemberDAO.updateInfo(member);
	}
	
	@Override
	public void removeMember(MemberVO memberVO) throws Exception {
		myPageMemberDAO.deleteMember(memberVO);
	}
}
