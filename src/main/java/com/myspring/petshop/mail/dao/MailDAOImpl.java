package com.myspring.petshop.mail.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.member.vo.MemberVO;

@Repository("mailDAO")
public class MailDAOImpl implements MailDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectEmail(MemberVO member) throws Exception {
		
		return sqlSession.selectOne("mapper.mail.selectEmail", member);
	}
		
	@Override
	public int selectEmailCnt(String email) throws Exception{
		
		return sqlSession.selectOne("mapper.mail.selectEmailCnt", email);
	}
}