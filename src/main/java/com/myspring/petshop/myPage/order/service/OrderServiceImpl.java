package com.myspring.petshop.myPage.order.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.manager.order.vo.OrderDetailVO;
import com.myspring.petshop.myPage.order.dao.OrderDAO;
import com.myspring.petshop.myPage.order.vo.OrderRefundVO;
import com.myspring.petshop.myPage.order.vo.PointHistoryVO;
import com.myspring.petshop.payment.vo.CombineVO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDAO orderDAO;
	
	@Override
	public int getOrderCnt(int member_num) throws Exception {
		
		return orderDAO.selectOrderCnt(member_num);
	}
	
	@Override
	public int getPointHistoryCnt(int member_num) throws Exception {
		
		return orderDAO.selectPointHistoryCnt(member_num);
	}
	
	@Override
	public List<CombineVO> getOrderList(Map<String, Object> orderMap) throws Exception {
		List<CombineVO> orderList = orderDAO.selectOrder(orderMap);
		
		return orderList;
	}	
	
	@Override
	public CombineVO getRefundInfo(String order_detailCode) throws Exception {
		
		return orderDAO.selectRefundInfo(order_detailCode);		
	}
	
	@Override
	public int getOrder_usePoint(String order_code) throws Exception {
		
		return orderDAO.selectOrder_usePoint(order_code);		
	}
	
	@Override
	public List<PointHistoryVO> getPointHistory(Map<String, Object> phMap) throws Exception {
		
		return orderDAO.selectPointHistory(phMap);		
	}
	
	@Override
	public void addOrderRefund(OrderRefundVO orderRefund) throws Exception {	
		String order_status = orderRefund.getOrder_status();
			if(order_status.equals("결제완료") || order_status.equals("배송준비중")) {
				int p_price = orderRefund.getP_price();
				int refund_quantity = orderRefund.getRefund_quantity();
				
				int usePoint = usePoint_calculation(p_price, refund_quantity);	//해당 상품 구매할 때 사용한 포인트 얼마인지 가져옴
				int member_num =  orderRefund.getMember_num();							//회원 번호 가져옴
				String order_code = orderRefund.getOrder_code();
				
				Map<String, Object> refundMap = new HashMap<String, Object>();
				refundMap.put("member_num", member_num);
				refundMap.put("usePoint", usePoint);											
				refundMap.put("order_code", order_code);	
				
				int order_usePoint = orderRefund.getOrder_usePoint();
				if(order_usePoint != 0) {												//해당 상품을 구매할 때 포인트를 사용했으면									
					orderDAO.updateReturnMemberPoint(refundMap);						//해당 회원에게 포인트를 되돌려줌
					orderDAO.insertAddPointHistory(refundMap);								//포인트 내역에 추가 
				}
				
				int addPoint = addPoint_calculation(p_price, refund_quantity);
				refundMap.put("orderRefund", orderRefund);										//환불 정보 객체
				refundMap.put("addPoint", addPoint);
				orderDAO.updateOrder(refundMap);													//orders 테이블을 수정															
			
				orderDAO.updateStock(refundMap);													//환불하려는 상품의 수량만큼 해당 상품의 재고 수를 추가
				
				orderRefund.setOrder_status("주문취소");
				orderDAO.updateOrderStatus(orderRefund);									//해당 주문번호의 주문현황을 '주문취소'로 변경
			}
			else {
				orderRefund.setOrder_status("환불요청");				//해당 주문번호의 주문현황을 '환불요청'로 변경
				orderDAO.updateOrderStatus(orderRefund);	
			}
			
			orderDAO.insertOrderRefund(orderRefund);
				
	}
	
	@Override
	public void buyConfirm(OrderDetailVO odv, int member_num) throws Exception {
		orderDAO.updateOrderStatus2(odv);
		
		int p_price = odv.getP_price();
		int order_quantity = odv.getOrder_quantity();
		
		int addPoint = addPoint_calculation(p_price, order_quantity);
		
		Map<String, Object> confirmMap = new HashMap<String, Object>();
		confirmMap.put("addPoint", addPoint);
		confirmMap.put("member_num", member_num);
		
		orderDAO.updateAddMemberPoint(confirmMap);
		
		String order_code = odv.getOrder_code();
		confirmMap.put("order_code", order_code);
		orderDAO.insertAddPointHistory2(confirmMap);
		
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
