package com.myspring.petshop.inquiry.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Component;

@Component("inquiryDAO")
public class InquiryDAOImpl implements InquiryDAO {
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List selectAllInquiryList(String p_code) throws DataAccessException {
		
		List inquiryList = null;
		inquiryList = session.selectList("mapper.board.selectAllInquiryList", p_code);
		return inquiryList;
	}
	
}
