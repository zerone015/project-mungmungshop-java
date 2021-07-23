package com.myspring.petshop.payment.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.payment.vo.PaymentPrdVO;
import com.myspring.petshop.payment.vo.PaymentVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public PaymentVO selectAddress(int member_num) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.payment.selectAddress", member_num); 
	}
	
	@Override
	public int selectCartChkQuantity(Map orderMap) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.payment.selectCartChkQuantity", orderMap); 
	}
	
	@Override
	public PaymentPrdVO selectCartChkProducts(String p_code) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.payment.selectCartChkProducts", p_code); 
	}
}
