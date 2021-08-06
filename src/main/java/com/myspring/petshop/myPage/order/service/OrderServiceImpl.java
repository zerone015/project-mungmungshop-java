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
	@Autowired
	private CombineVO combineVO;
	
	
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
	public void modOrder_status(String order_detailCode) throws Exception {
		orderDAO.updateOrder_status(order_detailCode);		
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
	public void addOrderRefund(OrderRefundVO orderRefund, int order_usePoint, String p_code) throws Exception {	
		String order_status = orderRefund.getOrder_status();
			if(order_status.equals("결제완료") || order_status.equals("배송준비중")) {
				orderRefund.setOrder_status("주문취소");
				orderDAO.insertOrderRefund(orderRefund);
				
				int usePoint =  usePoint_calculation(orderRefund.getOrder_detailCode());	//해당 상품 구매할 때 사용한 포인트 얼마인지 가져옴
				int addPoint = addPoint_calculation(orderRefund.getOrder_detailCode());		//해당 상품 구매할 때 적립된 포인트 얼마인지 가져옴 
				int member_num =  orderRefund.getMember_num();							//회원 번호 가져옴
				
				Map<String, Object> refundMap = new HashMap<String, Object>();
				refundMap.put("member_num", member_num);
				refundMap.put("usePoint", usePoint);
				refundMap.put("addPoint", addPoint);												
				refundMap.put("order_code", orderRefund.getOrder_code());							
				if(order_usePoint != 0) {												//해당 상품을 구매할 때 포인트를 사용했으면									
					orderDAO.updateReturnMemberPoint(refundMap);						//해당 회원에게 포인트를 되돌려줌
					orderDAO.insertAddPointHistory(refundMap);								//포인트 내역에 추가 
				}
				
				orderDAO.updateRetrieveMemberPoint(refundMap);								//해당 회원의 적립포인트 회수
				orderDAO.insertSubtractPointHistory(refundMap);								//포인트 내역에 추가
				
				refundMap.put("orderRefund", orderRefund);										//환불 정보 객체
				orderDAO.updateOrder(refundMap);													//orders 테이블을 수정															
				
				refundMap.put("refund_quantity", orderRefund.getRefund_quantity());				//환불 상품의 수량 
				refundMap.put("p_code", p_code);													//환불 상품의 고유코드
				orderDAO.updateStock(refundMap);													//환불하려는 상품의 수량만큼 해당 상품의 재고 수를 추가
													
				orderDAO.updateOrderStatus(orderRefund);									//해당 주문번호의 주문현황을 '주문취소'로 변경
			}
			else {
				orderRefund.setOrder_status("환불요청");
				orderDAO.insertOrderRefund(orderRefund);
				orderDAO.updateOrderStatus(orderRefund);									//해당 주문번호의 주문현황을 '환불요청'로 변경
			}
			
				
	}
	
	private int usePoint_calculation(String order_detailCode) throws Exception {
		OrderDetailVO orderDetailVO = orderDAO.selectOddPrice(order_detailCode);
		int p_price = orderDetailVO.getP_price();
		int order_quantity = orderDetailVO.getOrder_quantity();
		int usePoint = p_price * order_quantity / 10 ;
		
		return usePoint;
	}
	
	private int addPoint_calculation(String order_detailCode) throws Exception {
		OrderDetailVO orderDetailVO = orderDAO.selectOddPrice(order_detailCode);
		int p_price = orderDetailVO.getP_price();
		int order_quantity = orderDetailVO.getOrder_quantity();
		int addPoint = p_price * order_quantity / 60 ;
		
		return addPoint;
	}
}
