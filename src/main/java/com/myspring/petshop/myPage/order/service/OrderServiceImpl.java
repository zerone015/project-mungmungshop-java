package com.myspring.petshop.myPage.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.myPage.order.dao.OrderDAO;
import com.myspring.petshop.payment.vo.CombineVO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;
	@Autowired
	private CombineVO combineVO;
	
	
	@Override
	public int getOrderCnt(int member_num) throws Exception {
		
		return orderDAO.selectOrderCnt(member_num);
	}
	
	@Override
	public List<CombineVO> getOrderList(Map<String, Object> orderMap) throws Exception {
		List<CombineVO> orderList = orderDAO.selectOrder(orderMap);
		
		return orderList;
	}	
	
	@Override
	public CombineVO getRefundInfo(String order_detailCode) throws Exception {
		
		return orderDAO.selectRefundInfo(order_detailCode);		
	}
	
	@Override
	public void modOrder_status(String order_detailCode) throws Exception {
		orderDAO.updateOrder_status(order_detailCode);		
	}
	
	@Override
	public int getOrder_usePoint(String order_code) throws Exception {
		
		return orderDAO.selectOrder_usePoint(order_code);		
	}
}
