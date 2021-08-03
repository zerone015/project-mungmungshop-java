package com.myspring.petshop.member.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.myspring.petshop.member.vo.MemberVO;


public interface MemberDAO{
	public int selectIdCnt(MemberVO vo) throws Exception;
	public int selectNickNameCnt(MemberVO vo) throws Exception;
	public MemberVO selectLoginMember(String member_id) throws DataAccessException;
	public List<MemberVO> selectMemberId(MemberVO member) throws Exception;
	public int insertMember(MemberVO memberVO)throws DataAccessException;
	public void updateMemberPw(MemberVO memberVO)throws DataAccessException;
	public void updateLoginDate(int member_num) throws Exception;
	public List<MemberVO> batchSelectMember() throws DataAccessException;
	public void deleteMember(MemberVO memberVO) throws DataAccessException;
}