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
}
