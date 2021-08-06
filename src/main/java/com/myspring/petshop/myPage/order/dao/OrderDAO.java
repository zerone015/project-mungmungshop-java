package com.myspring.petshop.myPage.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;
import com.myspring.petshop.myPage.order.vo.PointHistoryVO;
import com.myspring.petshop.payment.vo.CombineVO;

public interface OrderDAO {
	public int selectOrderCnt(int member_num) throws DataAccessException;
	public List<CombineVO> selectOrder(Map<String, Object> orderMap) throws DataAccessException;
	public CombineVO selectRefundInfo(String order_detailCode) throws DataAccessException;
	public void updateOrder_status(String order_detailCode) throws DataAccessException;
	public int selectOrder_usePoint(String order_code) throws DataAccessException;
	public int selectPointHistoryCnt(int member_num) throws DataAccessException;
	public List<PointHistoryVO> selectPointHistory(Map<String, Object> phMap) throws DataAccessException;
	public OrderDetailVO selectOddPrice(String order_detailCode) throws DataAccessException;
	public void updateReturnMemberPoint(Map<String, Object> refundMap) throws DataAccessException;
	public void updateRetrieveMemberPoint(Map<String, Object> refundMap) throws DataAccessException;
	public void updateOrderStatus(OrderRefundVO orderRefund) throws DataAccessException;
	public void insertOrderRefund(OrderRefundVO orderRefund) throws DataAccessException;
	public void updateOrder(Map<String, Object> refundMap) throws DataAccessException;
	public void updateStock(Map<String, Object> refundMap) throws DataAccessException;
	public void insertAddPointHistory(Map<String, Object> refundMap) throws DataAccessException;
	public void insertSubtractPointHistory(Map<String, Object> refundMap) throws DataAccessException;
}
