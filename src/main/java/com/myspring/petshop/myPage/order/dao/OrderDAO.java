package com.myspring.petshop.myPage.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.payment.vo.CombineVO;

public interface OrderDAO {
	public int selectOrderCnt(int member_num) throws DataAccessException;
	public List<CombineVO> selectOrder(Map<String, Object> orderMap) throws DataAccessException;
}