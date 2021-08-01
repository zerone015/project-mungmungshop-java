package com.myspring.petshop.myPage.member.dao;

import org.springframework.dao.DataAccessException;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.member.vo.MemberVO;

public interface MyPageMemberDAO {
	public void updatePw(MemberVO memberVO) throws DataAccessException;
	public void updateInfo(MemberVO member) throws DataAccessException;
	public void deleteMember(MemberVO memberVO) throws DataAccessException;
}
