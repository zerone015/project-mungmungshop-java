package com.myspring.petshop.myPage.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.payment.vo.CombineVO;


@Repository
public class OrderDAOImpl implements OrderDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectOrderCnt(int member_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.order.selectOrderCnt", member_num);
	}
	
	@Override
	public List<CombineVO> selectOrder(Map<String, Object> orderMap) throws DataAccessException {
		return sqlSession.selectList("mapper.order.selectOrder", orderMap);
	}
}
