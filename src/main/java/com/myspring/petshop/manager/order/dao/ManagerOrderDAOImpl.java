package com.myspring.petshop.manager.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.order.vo.DeliveryVO;
import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.manager.order.vo.OrderVO;
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;
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
	public int selectRefundsCnt() throws DataAccessException {
		
		return sqlSession.selectOne("mapper.managerOrder.selectRefundsCnt");
	}
	
	@Override
	public List<CombineVO> selectOrderList(Pagination pagination) throws DataAccessException {
		
		return sqlSession.selectList("mapper.managerOrder.selectOrderList", pagination);
	}
	
	@Override
	public List<CombineVO> selectRefundList(Pagination pagination) throws DataAccessException {
		
		return sqlSession.selectList("mapper.managerOrder.selectRefundList", pagination);
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
	
	@Override
	public int selectSearchOrdersCnt(Map<String, Object> searchMap) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.managerOrder.selectSearchOrdersCnt", searchMap);
	}
	
	@Override
	public int selectSearchRefundsCnt(Map<String, Object> searchMap) throws DataAccessException {
		
		return sqlSession.selectOne("mapper.managerOrder.selectSearchRefundsCnt", searchMap);
	}
	
	@Override
	public List<CombineVO> selectSearchOrders(Map<String, Object> searchMap) throws DataAccessException {
		
		return sqlSession.selectList("mapper.managerOrder.selectSearchOrders", searchMap);
	}
	
	@Override
	public List<CombineVO> selectSearchRefunds(Map<String, Object> searchMap) throws DataAccessException {
		
		return sqlSession.selectList("mapper.managerOrder.selectSearchRefunds", searchMap);
	}
	
	@Override
	public void updateReturnMemberPoint(Map<String, Object> refundMap) throws DataAccessException {
		 sqlSession.update("mapper.managerOrder.updateReturnMemberPoint", refundMap);
	}
	
	@Override
	public void insertAddPointHistory(Map<String, Object> refundMap) throws DataAccessException {
		 sqlSession.insert("mapper.managerOrder.insertAddPointHistory", refundMap);
	}
	
	@Override
	public void updateOrder(Map<String, Object> refundMap) throws DataAccessException {
		 sqlSession.insert("mapper.managerOrder.updateOrder", refundMap);
	}
	
	@Override
	public void updateStock(Map<String, Object> refundMap) throws DataAccessException {
		 sqlSession.update("mapper.managerOrder.updateStock", refundMap);
	}
	
	@Override
	public void updateOrderStatus2(OrderRefundVO orderRefund) throws DataAccessException {
		sqlSession.update("mapper.managerOrder.updateOrderStatus2", orderRefund);
	}
	
	@Override
	public void updateOrderStatus3(CombineVO combineVO) throws DataAccessException {
		sqlSession.update("mapper.managerOrder.updateOrderStatus3", combineVO);
	}
	
	@Override
	public void updateRefundStatus(OrderRefundVO orderRefund) throws DataAccessException {
		 sqlSession.update("mapper.managerOrder.updateRefundStatus", orderRefund);
	}
	
	@Override
	public List<CombineVO> batchSelectOrders() throws DataAccessException {
		 
		return sqlSession.selectList("mapper.managerOrder.batchSelectOrders");
	}
	
	@Override
	public void batchUpdatePoint(CombineVO combineVO) throws DataAccessException {
		 sqlSession.update("mapper.managerOrder.batchUpdatePoint", combineVO);
	}
	
	@Override
	public void batchInsertPointHistory(CombineVO combineVO) throws DataAccessException {
		 sqlSession.update("mapper.managerOrder.batchInsertPointHistory", combineVO);
	}
	
}