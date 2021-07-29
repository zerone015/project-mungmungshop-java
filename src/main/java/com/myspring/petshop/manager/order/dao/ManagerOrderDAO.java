package com.myspring.petshop.manager.order.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.payment.vo.CombineVO;

public interface ManagerOrderDAO {
	public int selectOrdersCnt() throws DataAccessException;
	public List<CombineVO> selectOrderList(Pagination pagination) throws DataAccessException;
}
