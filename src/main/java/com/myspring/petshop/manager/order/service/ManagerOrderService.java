package com.myspring.petshop.manager.order.service;

import java.util.List;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.payment.vo.CombineVO;

public interface ManagerOrderService {
	public int getOrdersCnt() throws Exception;
	public List<CombineVO> getOrderList(Pagination pagination) throws Exception;
}
