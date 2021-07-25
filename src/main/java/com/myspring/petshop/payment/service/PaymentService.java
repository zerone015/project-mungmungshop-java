package com.myspring.petshop.payment.service;

import java.util.Map;

import com.myspring.petshop.myPage.address.vo.AddressVO;
import com.myspring.petshop.payment.vo.PaymentVO;

public interface PaymentService {
	public AddressVO getAddress(int member_num) throws Exception;
	public int getCartChkQuantity(Map orderMap) throws Exception;
	public PaymentVO getCartChkProducts(String p_code) throws Exception;
}
