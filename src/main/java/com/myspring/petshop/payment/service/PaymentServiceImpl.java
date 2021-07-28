package com.myspring.petshop.payment.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.myPage.address.vo.AddressVO;
import com.myspring.petshop.payment.dao.PaymentDAO;
import com.myspring.petshop.payment.vo.CombineVO;
import com.myspring.petshop.payment.vo.PaymentVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	PaymentDAO paymentDAO;
	
	@Override
	public AddressVO getAddress(int member_num) throws Exception {
		
		return paymentDAO.selectAddress(member_num);
	}
	
	@Override
	public int getCartChkQuantity(Map<String, Object> orderMap) throws Exception {
		
		return paymentDAO.selectCartChkQuantity(orderMap);
	}
	
	@Override
	public PaymentVO getCartChkProducts(String p_code) throws Exception {
		
		return paymentDAO.selectCartChkProducts(p_code);
	}
	
	@Override
	public String addPayment(CombineVO combineVO, String sale_check) throws Exception {
		int order_num = getOrderNum();
		combineVO.setOrder_num(order_num);
		
		paymentDAO.insertOrder(combineVO);
		
		String order_code = paymentDAO.selectOrderCode(order_num);
		combineVO.setOrder_code(order_code);
		
		paymentDAO.insertOrderDetail(combineVO);
		
		paymentDAO.insertDelivery(combineVO);
		paymentDAO.updateAddMemberPoint(combineVO);
	
		if(sale_check != null) {
			paymentDAO.updateSubtractMemberPoint(combineVO);
		}
		
		return order_code;
	}
	
	@Override
	public String addPayments(Map<String, Object> paymentMap, CombineVO combineVO, String sale_check) throws Exception {
		String[] p_codes = (String[]) paymentMap.get("p_codes");
		String[] order_quantitys = (String[]) paymentMap.get("order_quantitys");
		String[] p_prices = (String[]) paymentMap.get("p_prices");
			
		int order_num = getOrderNum();
		combineVO.setOrder_num(order_num);
		
		paymentDAO.insertOrder(combineVO);
		
		String order_code = paymentDAO.selectOrderCode(order_num);
		combineVO.setOrder_code(order_code);
		
		for(int i=0; i<p_codes.length; i++) {
			String p_code = p_codes[i];
			int order_quantity = Integer.parseInt(order_quantitys[i]);
			int p_price = Integer.parseInt(p_prices[i]);
			
			combineVO.setP_code(p_code);
			combineVO.setOrder_quantity(order_quantity);
			combineVO.setP_price(p_price);
			
			paymentDAO.insertOrderDetail(combineVO);
		}
		paymentDAO.insertDelivery(combineVO);
		paymentDAO.updateAddMemberPoint(combineVO);
		
		if(sale_check != null) {
			paymentDAO.updateSubtractMemberPoint(combineVO);
		}
		
		return order_code;
	}
	
	@Override
	public void addAddress(CombineVO combineVO) throws Exception {
		
		paymentDAO.insertAddress(combineVO);
		
	}
	
	@Override
	public MemberVO getMember(int member_num) throws Exception {
		
		return paymentDAO.selectMember(member_num);
		
	}
	
	private int getOrderNum() throws Exception {
		int result;
		
		try {
			result = paymentDAO.selectMaxOrderNum()+1;
		}
		catch(NullPointerException e) {
			result = 0;
		}
		
		return result;
	}
}