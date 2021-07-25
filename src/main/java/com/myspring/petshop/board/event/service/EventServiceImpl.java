package com.myspring.petshop.board.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.board.event.dao.EventDAO;
import com.myspring.petshop.board.event.vo.EventVO;
import com.myspring.petshop.common.pagination.Pagination;

@Service("eventService")
@Transactional(propagation = Propagation.REQUIRED)
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;
	
	@Override
	public List listEvent(Pagination pagination) throws DataAccessException{
		List eventList = null;
		eventList = eventDAO.selectAllEventList(pagination);
		return eventList;
	}
	
	@Override
	public int eventCnt() throws DataAccessException {
		return eventDAO.eventCnt();
	}
	
	@Override
	public int eventWrite(EventVO event) throws DataAccessException{
		return eventDAO.eventWrite(event);
	}
	
	@Override
	public EventVO viewEvent(int event_no) throws DataAccessException {
		EventVO eventVO = eventDAO.selectEvent(event_no);
		return eventVO;
	}
	
	@Override
	public EventVO eventMod(int event_no) throws DataAccessException {
		EventVO eventVO = eventDAO.selectEvent(event_no);
		
		return eventVO;
	}
	
	@Override
	public int eventRemove(int event_no) throws DataAccessException {
		return eventDAO.eventDelete(event_no);
	}
	
	@Override
	public int increaseHits(int event_no) {
		// TODO Auto-generated method stub
		return eventDAO.increaseHist(event_no);
	}
	
	@Override
	public int eventModify(EventVO eventVO) throws DataAccessException {
		
		return eventDAO.eventUpdate(eventVO);
	}
	
}
