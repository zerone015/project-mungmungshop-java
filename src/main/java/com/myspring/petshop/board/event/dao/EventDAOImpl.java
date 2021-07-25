package com.myspring.petshop.board.event.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.board.event.vo.EventVO;
import com.myspring.petshop.common.pagination.Pagination;

@Repository("eventDAO")
public class EventDAOImpl implements EventDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllEventList(Pagination pagination) throws DataAccessException{
		return sqlSession.selectList("mapper.board.selectAllEventList", pagination);
	}
	
	@Override
	public int eventCnt() throws DataAccessException{
		return sqlSession.selectOne("mapper.board.selectEventCnt");
	}
	
	@Override
	public int eventWrite(EventVO eventVO)throws DataAccessException{
		int result=sqlSession.insert("mapper.board.insertEvent", eventVO);
		return result;
	}

	@Override
	public EventVO selectEvent(int event_no) throws DataAccessException { 
		return sqlSession.selectOne("mapper.board.eventView", event_no);
	}
	
	@Override
	public int eventUpdate(EventVO eventVO) throws DataAccessException {
		int result = sqlSession.update("mapper.board.eventUpdate", eventVO);
		return result;
	}
	

	@Override
	public int eventDelete(int event_no) throws DataAccessException {
		int result=sqlSession.delete("mapper.board.eventDelete", event_no);
		return result;
	}

	@Override
	public int increaseHist(int event_no) {
		int result = sqlSession.update("mapper.board.eventHits", event_no);	
		return result;
	}




}
