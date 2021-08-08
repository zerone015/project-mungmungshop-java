package com.myspring.petshop.manager.order.service;


import java.util.List;
import java.util.Map;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;
import com.myspring.petshop.payment.vo.CombineVO;


public interface ManagerOrderService {
	public int getOrdersCnt() throws Exception;
	public int getRefundsCnt() throws Exception;
	public List<CombineVO> getOrderList(Pagination pagination) throws Exception;
	public List<CombineVO> getRefundList(Pagination pagination) throws Exception;
	public Map<String, Object> getOrderInfo(String order_code) throws Exception;
	public void modOrderStatus(OrderDetailVO ord) throws Exception;
	public int searchOrdersCnt(Map<String, Object> searchMap) throws Exception;
	public int searchRefundsCnt(Map<String, Object> searchMap) throws Exception;
	public List<CombineVO> getSearchOrders(Map<String, Object> searchMap) throws Exception;
	public List<CombineVO> getSearchRefunds(Map<String, Object> searchMap) throws Exception;
	public void modRefundStatus(OrderRefundVO orderRefundVO) throws Exception;
	public void batchBuyConfirm() throws Exception;
}
