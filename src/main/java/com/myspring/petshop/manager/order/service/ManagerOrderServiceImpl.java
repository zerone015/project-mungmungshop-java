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
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;
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
	@Autowired
	private CombineVO combineVO;

	
	@Override
	public int getOrdersCnt() throws Exception {
		
		return managerDAO.selectOrdersCnt();
	}
	
	@Override
	public int getRefundsCnt() throws Exception {
		
		return managerDAO.selectRefundsCnt();
	}
	
	@Override
	public List<CombineVO> getOrderList(Pagination pagination) throws Exception {
				
		return managerDAO.selectOrderList(pagination);
		
	}
	
	@Override
	public List<CombineVO> getRefundList(Pagination pagination) throws Exception {
				
		return managerDAO.selectRefundList(pagination);
		
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
	public int searchRefundsCnt(Map<String, Object> searchMap) throws Exception {
		
		return managerDAO.selectSearchRefundsCnt(searchMap);
	}	
	
	@Override
	public List<CombineVO> getSearchOrders(Map<String, Object> searchMap) throws Exception {
		
		return managerDAO.selectSearchOrders(searchMap);
	}	
	
	@Override
	public List<CombineVO> getSearchRefunds(Map<String, Object> searchMap) throws Exception {
		
		return managerDAO.selectSearchRefunds(searchMap);
	}
	
	@Override
	public void modRefundStatus(OrderRefundVO orderRefund) throws Exception {
		int p_price = orderRefund.getP_price();
		int refund_quantity = orderRefund.getRefund_quantity();
		
		int usePoint = usePoint_calculation(p_price, refund_quantity);
		int member_num = orderRefund.getMember_num();
		String order_code = orderRefund.getOrder_code();
		
		Map<String, Object> refundMap = new HashMap<String, Object>();
		refundMap.put("usePoint", usePoint);	
		refundMap.put("member_num", member_num);
		refundMap.put("order_code", order_code);	
		
		int order_usePoint = orderRefund.getOrder_usePoint();
		if(order_usePoint != 0) {												//해당 상품을 구매할 때 포인트를 사용했으면									
			managerDAO.updateReturnMemberPoint(refundMap);						//해당 회원에게 포인트를 되돌려줌
			managerDAO.insertAddPointHistory(refundMap);								//포인트 내역에 추가 
		}
		
		int addPoint = addPoint_calculation(p_price, refund_quantity);
		refundMap.put("orderRefund", orderRefund);
		refundMap.put("addPoint", addPoint);
		managerDAO.updateOrder(refundMap);
		
		managerDAO.updateStock(refundMap);
		
		orderRefund.setOrder_status("환불완료");
		managerDAO.updateOrderStatus2(orderRefund);
		managerDAO.updateRefundStatus(orderRefund);
	}	
	
	@Override
	public void batchBuyConfirm() throws Exception {
		List<CombineVO> batchList = managerDAO.batchSelectOrders();
		
		if(batchList.size() != 0) {
			for(int i=0; i<batchList.size(); i++) {
				combineVO = batchList.get(i);
				int p_price = combineVO.getP_price();
				int order_quantity = combineVO.getOrder_quantity();
				int order_addPoint = addPoint_calculation(p_price, order_quantity);
				combineVO.setOrder_addPoint(order_addPoint);
				managerDAO.batchUpdatePoint(combineVO);
				managerDAO.batchInsertPointHistory(combineVO);
				managerDAO.updateOrderStatus3(combineVO);
			}
		}
	}
	
	private int usePoint_calculation(int p_price, int refund_quantity) throws Exception {
		int usePoint = p_price * refund_quantity / 10 ;
		
		return usePoint;
	}
	
	private int addPoint_calculation(int p_price, int refund_quantity) throws Exception {
		int addPoint = p_price * refund_quantity / 60 ;
		
		return addPoint;
	}
}