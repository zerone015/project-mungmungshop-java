package com.myspring.petshop.board.event.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.board.event.vo.EventVO;
import com.myspring.petshop.common.pagination.Pagination;

public interface EventService {
	public List listEvent(Pagination pagination) throws DataAccessException;
	public int eventWrite(EventVO eventVO) throws DataAccessException;
	public EventVO viewEvent(int event_no) throws DataAccessException;
	public EventVO eventMod(int event_no) throws Exception;
	public int eventRemove(int event_no) throws DataAccessException;
	public int increaseHits(int event_no) throws DataAccessException;
	public int eventModify(EventVO eventVO) throws DataAccessException;
	public int eventCnt() throws DataAccessException;
}
