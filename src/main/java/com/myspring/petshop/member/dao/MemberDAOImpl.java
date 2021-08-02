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
	
	public MemberVO selectLoginMember(MemberVO memberVO) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.member.selectLoginMember", memberVO);
	}
	
	@Override
	public List selectMemberId(MemberVO member) throws DataAccessException {
		
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
	public void updateNaverLoginDate(String member_id) throws DataAccessException {
		sqlSession.update("mapper.member.updateNaverLoginDate", member_id);
	}
	
	@Override
	public void insertNaverMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.insert("mapper.member.insertNaverMember", memberVO);
	}
	
	@Override
	public MemberVO selectNaverMember(String member_id) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.member.selectNaverMember", member_id);
	}
	
	@Override
	//DB 에서 최근 접속 날짜가 1년이 지난 회원 목록 조회
	public List<MemberVO> batchSelectMember() throws DataAccessException {
		return sqlSession.selectList("mapper.member.batchSelectMember");
	}
	
	@Override
	//DB 에서 최근 접속 날짜가 1년이 지난 회원 목록 삭제
	public void deleteMember(MemberVO memberVO) throws DataAccessException {
		sqlSession.delete("mapper.member.deleteMember", memberVO);
	}
}