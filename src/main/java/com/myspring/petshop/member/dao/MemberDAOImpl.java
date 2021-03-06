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
	public int selectIdCnt(MemberVO vo) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.member.selectIdCnt", vo);
	}
	
	@Override
	public int selectNickNameCnt(MemberVO vo) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.member.selectNickNameCnt", vo);
	}
	
	public MemberVO selectLoginMember(String member_id) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.member.selectLoginMember", member_id);
	}
	
	@Override
	public List<MemberVO> selectMemberId(MemberVO member) throws DataAccessException {
		
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
	
	@Override
	public void updateLoginDate(int member_num) throws DataAccessException {
		sqlSession.update("mapper.member.updateLoginDate", member_num);
	}
	
	@Override
	public List<MemberVO> batchSelectMember() throws DataAccessException {
		return sqlSession.selectList("mapper.member.batchSelectMember");
	}
	
	@Override
	public void deleteMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.delete("mapper.member.deleteMember", memberVO);
	}
}