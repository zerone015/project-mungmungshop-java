package com.myspring.petshop.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.member.dao.MemberDAO;
import com.myspring.petshop.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public int getIdCnt(MemberVO vo) throws Exception {
		
		return memberDAO.selectIdCnt(vo);
	}
	
	@Override
	public int getNickNameCnt(MemberVO vo) throws Exception {
		
		return memberDAO.selectNickNameCnt(vo); 
	}
	
	@Override
	public MemberVO login(String member_id) throws Exception{
		
		return memberDAO.selectLoginMember(member_id);
	}
	
	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		
		return memberDAO.insertMember(member);
	}	
	
	@Override
	public List<MemberVO> findId(MemberVO member) throws Exception {
		
		return memberDAO.selectMemberId(member);
		
	}
	
	@Override
	public void changePw(MemberVO member) throws Exception {
		memberDAO.updateMemberPw(member);
	}
	
	@Override
	public void modLoginDate(int member_num) throws Exception {
		memberDAO.updateLoginDate(member_num);
	}
	

}