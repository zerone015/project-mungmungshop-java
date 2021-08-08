package com.myspring.petshop.payment.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.myPage.address.vo.AddressVO;
import com.myspring.petshop.payment.vo.CombineVO;
import com.myspring.petshop.payment.vo.PaymentVO;

@Repository
public class PaymentDAOImpl implements PaymentDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public AddressVO selectAddress(int member_num) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.payment.selectAddress", member_num); 
	}
	
	@Override
	public int selectCartChkQuantity(Map<String, Object> orderMap) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.payment.selectCartChkQuantity", orderMap); 
	}
	
	@Override
	public PaymentVO selectCartChkProducts(String p_code) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.payment.selectCartChkProducts", p_code); 
	}
	
	@Override
	public void insertOrder(CombineVO combineVO) throws DataAccessException {
		
		sqlSession.insert("mapper.payment.insertOrder", combineVO); 
	}
	
	@Override
	public int selectMaxOrderNum() throws DataAccessException {
		
		return sqlSession.selectOne("mapper.payment.selectMaxOrderNum"); 
	}
	
	@Override
	public String selectOrderCode(int order_num) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.payment.selectOrderCode", order_num); 
	}
	
	@Override
	public void insertOrderDetail(CombineVO combineVO) throws DataAccessException {
		
		sqlSession.insert("mapper.payment.insertOrderDetail", combineVO); 
	}
	
	@Override
	public void insertDelivery(CombineVO combineVO) throws DataAccessException {
		
		sqlSession.insert("mapper.payment.insertDelivery", combineVO); 
	}
	
	@Override
	public void updateSubtractMemberPoint(CombineVO combineVO) throws DataAccessException {
		
		sqlSession.update("mapper.payment.updateSubtractMemberPoint", combineVO); 
	}
	
	@Override
	public void insertAddress(CombineVO combineVO) throws DataAccessException {
		
		sqlSession.insert("mapper.payment.insertAddress", combineVO); 
	}
	
	@Override
	public MemberVO selectMember(int member_num) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.payment.selectMember", member_num); 
	}
}