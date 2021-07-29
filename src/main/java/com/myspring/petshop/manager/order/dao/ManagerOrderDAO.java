package com.myspring.petshop.manager.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.order.vo.DeliveryVO;
import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.manager.order.vo.OrderVO;
import com.myspring.petshop.payment.vo.CombineVO;

public interface ManagerOrderDAO {
	public int selectOrdersCnt() throws DataAccessException;
	public List<CombineVO> selectOrderList(Pagination pagination) throws DataAccessException;
	public OrderVO selectOrder(String order_code) throws DataAccessException;
	public List<OrderDetailVO> selectOrderDetail(String order_code) throws DataAccessException;
	public DeliveryVO selectDelevery(String order_code) throws DataAccessException;
	public void updateOrderStatus(OrderDetailVO ord) throws DataAccessException;
}
