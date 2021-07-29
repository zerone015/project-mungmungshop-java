package com.myspring.petshop.myPage.order.service;

import java.util.List;
import java.util.Map;

import com.myspring.petshop.payment.vo.CombineVO;

public interface OrderService {

	public int getOrderCnt(int member_num) throws Exception;
	public List<CombineVO> getOrderList(Map<String, Object> orderMap) throws Exception;
	
} 
