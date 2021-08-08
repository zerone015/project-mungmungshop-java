package com.myspring.petshop.myPage.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;
import com.myspring.petshop.myPage.order.vo.PointHistoryVO;
import com.myspring.petshop.payment.vo.CombineVO;


@Repository
public class OrderDAOImpl implements OrderDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectOrderCnt(int member_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.order.selectOrderCnt", member_num);
	}
	
	@Override
	public int selectPointHistoryCnt(int member_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.order.selectPointHistoryCnt", member_num);
	}
	
	@Override
	public List<CombineVO> selectOrder(Map<String, Object> orderMap) throws DataAccessException {
		return sqlSession.selectList("mapper.order.selectOrder", orderMap);
	}
	
	@Override
	public CombineVO selectRefundInfo(String order_detailCode) throws DataAccessException {
		return sqlSession.selectOne("mapper.order.selectRefundInfo", order_detailCode);
	}
	
	@Override
	public void updateOrder_status(String order_detailCode) throws DataAccessException {
		sqlSession.update("mapper.order.updateOrder_status", order_detailCode);
	}
	
	@Override
	public int selectOrder_usePoint(String order_code) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.order.selectOrder_usePoint", order_code);
	}
	
	@Override
	public List<PointHistoryVO> selectPointHistory(Map<String, Object> phMap) throws DataAccessException {
		
		return sqlSession.selectList("mapper.order.selectPointHistory", phMap);
	}
	
	
	@Override
	public OrderDetailVO selectOddPrice(String order_detailCode) throws DataAccessException {
		return sqlSession.selectOne("mapper.order.selectOddPrice", order_detailCode);
	}
	
	@Override
	public void updateReturnMemberPoint(Map<String, Object> refundMap) throws DataAccessException {
		 sqlSession.update("mapper.order.updateReturnMemberPoint", refundMap);
	}
	
	@Override
	public void updateOrderStatus(OrderRefundVO orderRefund) throws DataAccessException {
		 sqlSession.update("mapper.order.updateOrderStatus", orderRefund);
	}
	
	@Override
	public void insertOrderRefund(OrderRefundVO orderRefund) throws DataAccessException {
		 sqlSession.insert("mapper.order.insertOrderRefund", orderRefund);
	}
	
	@Override
	public void updateOrder(Map<String, Object> refundMap) throws DataAccessException {
		 sqlSession.insert("mapper.order.updateOrder", refundMap);
	}
	
	@Override
	public void updateStock(Map<String, Object> refundMap) throws DataAccessException {
		 sqlSession.update("mapper.order.updateStock", refundMap);
	}
		
	@Override
	public void insertAddPointHistory(Map<String, Object> refundMap) throws DataAccessException {
		 sqlSession.insert("mapper.order.insertAddPointHistory", refundMap);
	}
}