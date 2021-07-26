package com.myspring.petshop.payment.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.myPage.address.vo.AddressVO;
import com.myspring.petshop.payment.dao.PaymentDAO;
import com.myspring.petshop.payment.vo.CombineVO;
import com.myspring.petshop.payment.vo.PaymentVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	PaymentDAO paymentDAO;
	
	@Override
	public AddressVO getAddress(int member_num) throws Exception {
		
		return paymentDAO.selectAddress(member_num);
	}
	
	@Override
	public int getCartChkQuantity(Map orderMap) throws Exception {
		
		return paymentDAO.selectCartChkQuantity(orderMap);
	}
	
	@Override
	public PaymentVO getCartChkProducts(String p_code) throws Exception {
		
		return paymentDAO.selectCartChkProducts(p_code);
	}
	
	@Override
	public void addPayment(CombineVO combineVO) throws Exception {
		paymentDAO.insertOrder(combineVO);
		
	}
}