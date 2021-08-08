package com.myspring.petshop.manager.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.order.vo.DeliveryVO;
import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.manager.order.vo.OrderVO;
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;
import com.myspring.petshop.payment.vo.CombineVO;

public interface ManagerOrderDAO {
	public int selectOrdersCnt() throws DataAccessException;
	public int selectRefundsCnt() throws DataAccessException;
	public List<CombineVO> selectOrderList(Pagination pagination) throws DataAccessException;
	public List<CombineVO> selectRefundList(Pagination pagination) throws DataAccessException;
	public OrderVO selectOrder(String order_code) throws DataAccessException;
	public List<OrderDetailVO> selectOrderDetail(String order_code) throws DataAccessException;
	public DeliveryVO selectDelevery(String order_code) throws DataAccessException;
	public void updateOrderStatus(OrderDetailVO ord) throws DataAccessException;
	public int selectSearchOrdersCnt(Map<String, Object> searchMap) throws DataAccessException;
	public int selectSearchRefundsCnt(Map<String, Object> searchMap) throws DataAccessException;
	public List<CombineVO> selectSearchOrders(Map<String, Object> searchMap) throws DataAccessException;
	public List<CombineVO> selectSearchRefunds(Map<String, Object> searchMap) throws DataAccessException;
	public void updateReturnMemberPoint(Map<String, Object> refundMap) throws DataAccessException;
	public void insertAddPointHistory(Map<String, Object> refundMap) throws DataAccessException;
	public void updateOrder(Map<String, Object> refundMap) throws DataAccessException;
	public void updateStock(Map<String, Object> refundMap) throws DataAccessException;
	public void updateOrderStatus2(OrderRefundVO orderRefund) throws DataAccessException;
	public void updateOrderStatus3(CombineVO combineVO) throws DataAccessException;
	public void updateRefundStatus(OrderRefundVO orderRefund) throws DataAccessException;
	public List<CombineVO> batchSelectOrders() throws DataAccessException;
	public void batchUpdatePoint(CombineVO combineVO) throws DataAccessException;
	public void batchInsertPointHistory(CombineVO combineVO) throws DataAccessException;
}
