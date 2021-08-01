package com.myspring.petshop.myPage.member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.member.vo.MemberVO;

@Repository
public class MyPageMemberDAOImpl implements MyPageMemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void updatePw(MemberVO memberVO) throws DataAccessException {
		sqlSession.update("mapper.myPageMember.updatePw", memberVO);
	}
	
	@Override
	public void updateInfo(MemberVO member) throws DataAccessException {
		sqlSession.update("mapper.myPageMember.updateInfo", member);
	}
	
	@Override
	public void deleteMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.delete("mapper.myPageMember.deleteMember", memberVO);
	}
}