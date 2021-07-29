package com.myspring.petshop.manager.order.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.common.pagination.Pagination;
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
	public List<CombineVO> selectOrderList(Pagination pagination) throws DataAccessException {
		
		return sqlSession.selectList("mapper.managerOrder.selectOrderList", pagination);
	}
}