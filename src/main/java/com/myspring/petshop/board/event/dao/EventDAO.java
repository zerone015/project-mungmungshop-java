package com.myspring.petshop.board.event.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.Pagination;
import com.myspring.petshop.board.event.vo.EventVO;

public interface EventDAO {

	public List selectAllEventList(Pagination pagination) throws DataAccessException;

	public int eventWrite(EventVO eventVO) throws DataAccessException;

	public EventVO selectEvent(int event_no) throws DataAccessException;

	public int eventUpdate(EventVO eventVO) throws DataAccessException;
	
	public int eventDelete(int event_no) throws DataAccessException;

	public int increaseHist(int event_no) throws DataAccessException;

	public int eventCnt() throws DataAccessException;
}
