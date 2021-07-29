package com.myspring.petshop.manager.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.order.dao.ManagerOrderDAO;
import com.myspring.petshop.payment.vo.CombineVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ManagerOrderServiceImpl implements ManagerOrderService{
	@Autowired
	private ManagerOrderDAO managerDAO;
	
	
	@Override
	public int getOrdersCnt() throws Exception {
		
		return managerDAO.selectOrdersCnt();
	}
	
	@Override
	public List<CombineVO> getOrderList(Pagination pagination) throws Exception {
		
		return managerDAO.selectOrderList(pagination);
	}
	
}