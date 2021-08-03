package com.myspring.petshop.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.member.vo.MemberVO;

public interface MemberService{
	public int getIdCnt(MemberVO vo) throws Exception;
	public int getNickNameCnt(MemberVO vo) throws Exception;
	public MemberVO login(String member_id) throws Exception;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public List<MemberVO> findId(MemberVO member) throws Exception;
	public void changePw(MemberVO member) throws Exception;
	public void modLoginDate(int member_num) throws Exception;
}