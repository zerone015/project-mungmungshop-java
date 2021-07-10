package com.myspring.petshop.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectIdCnt(MemberVO vo) throws Exception {
		
		return sqlSession.selectOne("mapper.member.selectIdCnt", vo);
	}
	
	@Override
	public int selectNickNameCnt(MemberVO vo) throws Exception {
		
		return sqlSession.selectOne("mapper.member.selectNickNameCnt", vo);
	}
	
	public MemberVO selectLoginMember(MemberVO memberVO) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.member.selectLoginMember", memberVO);
	}
	
	@Override
	public List selectMemberId(MemberVO member) throws Exception {
		
		return sqlSession.selectList("mapper.member.selectMemberId", member);
	}
	
	@Override
	public int insertMember(MemberVO memberVO)throws DataAccessException {
		
		return sqlSession.insert("mapper.member.insertMember", memberVO);
	}
	
	
	@Override
	public void updateMemberPw(MemberVO memberVO)throws DataAccessException {
		sqlSession.update("mapper.member.updateMemberPw", memberVO);
	}
}