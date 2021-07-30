package com.myspring.petshop.manager.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.order.dao.ManagerOrderDAO;
import com.myspring.petshop.manager.order.vo.DeliveryVO;
import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.manager.order.vo.OrderVO;
import com.myspring.petshop.payment.vo.CombineVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ManagerOrderServiceImpl implements ManagerOrderService{
	@Autowired
	private ManagerOrderDAO managerDAO;
	@Autowired
	private OrderVO orderVO;
	@Autowired
	private DeliveryVO deliveryVO;

	
	@Override
	public int getOrdersCnt() throws Exception {
		
		return managerDAO.selectOrdersCnt();
	}
	
	@Override
	public List<CombineVO> getOrderList(Pagination pagination) throws Exception {
				
		return managerDAO.selectOrderList(pagination);
		
	}
	
	@Override
	public Map<String, Object> getOrderInfo(String order_code) throws Exception {
				
		orderVO = managerDAO.selectOrder(order_code);
		deliveryVO = managerDAO.selectDelevery(order_code);
		List<OrderDetailVO> orderDetailList = managerDAO.selectOrderDetail(order_code);
		
		Map<String, Object> orderMap = new HashMap<String, Object>();
		orderMap.put("orderVO", orderVO);
		orderMap.put("deliveryVO", deliveryVO);
		orderMap.put("orderDetailList", orderDetailList);
		
		return orderMap;
	}
	
	@Override
	public void modOrderStatus(OrderDetailVO ord) throws Exception {
		managerDAO.updateOrderStatus(ord);
	}
	
	@Override
	public int searchOrdersCnt(Map<String, Object> searchMap) throws Exception {
		
		return managerDAO.selectSearchOrdersCnt(searchMap);
	}	
	
	@Override
	public List<CombineVO> getSearchOrders(Map<String, Object> searchMap) throws Exception {
		
		return managerDAO.selectSearchOrders(searchMap);
	}	
}