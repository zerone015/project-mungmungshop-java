package com.myspring.petshop.myPage.member.service;

import com.myspring.petshop.member.vo.MemberVO;

public interface MyPageMemberService {
	public void modPw(MemberVO memberVO) throws Exception;
	public void modifyInfo(MemberVO member) throws Exception;
	public void removeMember(MemberVO memberVO) throws Exception;
}
