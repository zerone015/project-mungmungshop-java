package com.myspring.petshop.payment.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.myPage.address.vo.AddressVO;
import com.myspring.petshop.payment.vo.CombineVO;
import com.myspring.petshop.payment.vo.PaymentVO;

public interface PaymentDAO {
	public AddressVO selectAddress(int member_num) throws DataAccessException;
	public int selectCartChkQuantity(Map orderMap) throws DataAccessException;
	public PaymentVO selectCartChkProducts(String p_code) throws DataAccessException;
	public void insertOrder(CombineVO combineVO) throws DataAccessException;
	public int selectMaxOrderNum() throws DataAccessException;
	public String selectOrderCode(int order_num) throws DataAccessException;
	public int insertOrderDetail(CombineVO combineVO) throws DataAccessException;
	public int insertDelivery(CombineVO combineVO) throws DataAccessException;
}
