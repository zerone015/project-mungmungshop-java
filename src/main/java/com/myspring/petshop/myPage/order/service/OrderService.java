package com.myspring.petshop.myPage.order.service;

import java.util.List;
import java.util.Map;

import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;
import com.myspring.petshop.myPage.order.vo.PointHistoryVO;
import com.myspring.petshop.payment.vo.CombineVO;

public interface OrderService {

	public int getOrderCnt(int member_num) throws Exception;
	public List<CombineVO> getOrderList(Map<String, Object> orderMap) throws Exception;
	public CombineVO getRefundInfo(String order_detailCode) throws Exception;
	public int getOrder_usePoint(String order_code) throws Exception;
	public int getPointHistoryCnt(int member_num) throws Exception;
	public List<PointHistoryVO> getPointHistory(Map<String, Object> phMap) throws Exception;
	public void addOrderRefund(OrderRefundVO orderRefund) throws Exception;
	public void buyConfirm(OrderDetailVO odv, int member_num) throws Exception;
} 
