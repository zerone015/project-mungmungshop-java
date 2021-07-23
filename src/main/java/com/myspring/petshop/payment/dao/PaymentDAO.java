package com.myspring.petshop.payment.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.payment.vo.PaymentPrdVO;
import com.myspring.petshop.payment.vo.PaymentVO;

public interface PaymentDAO {
	public PaymentVO selectAddress(int member_num) throws DataAccessException;
	public int selectCartChkQuantity(Map orderMap) throws DataAccessException;
	public PaymentPrdVO selectCartChkProducts(String p_code) throws DataAccessException;
}
