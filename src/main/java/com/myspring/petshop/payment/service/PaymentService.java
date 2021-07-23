package com.myspring.petshop.payment.service;

import java.util.Map;

import com.myspring.petshop.payment.vo.PaymentPrdVO;
import com.myspring.petshop.payment.vo.PaymentVO;

public interface PaymentService {
	public PaymentVO getAddress(int member_num) throws Exception;
	public int getCartChkQuantity(Map orderMap) throws Exception;
	public PaymentPrdVO getCartChkProducts(String p_code) throws Exception;
}
