package com.myspring.petshop.manager.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.order.vo.DeliveryVO;
import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.manager.order.vo.OrderVO;
import com.myspring.petshop.payment.vo.CombineVO;

@Repository
public class ManagerOrderDAOImpl implements ManagerOrderDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectOrdersCnt() throws DataAccessException {
		
		return sqlSession.selectOne("mapper.managerOrder.selectOrdersCnt");
	}
	
	@Override
	public List<CombineVO> selectOrderList(Pagination pagination) throws DataAccessException {
		
		return sqlSession.selectList("mapper.managerOrder.selectOrderList", pagination);
	}
	
	@Override
	public OrderVO selectOrder(String order_code) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.managerOrder.selectOrder", order_code);
	}
	
	@Override
	public List<OrderDetailVO> selectOrderDetail(String order_code) throws DataAccessException {
		
		return sqlSession.selectList("mapper.managerOrder.selectOrderDetail", order_code);
	}
	
	@Override
	public DeliveryVO selectDelevery(String order_code) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.managerOrder.selectDelevery", order_code);
	}
	
	@Override
	public void updateOrderStatus(OrderDetailVO ord) throws DataAccessException {
		
		sqlSession.update("mapper.managerOrder.updateOrderStatus", ord);
	}
}