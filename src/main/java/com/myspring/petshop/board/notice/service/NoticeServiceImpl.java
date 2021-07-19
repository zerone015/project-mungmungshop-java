package com.myspring.petshop.board.notice.service; 



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.board.notice.dao.NoticeDAO;
import com.myspring.petshop.board.notice.vo.NoticeVO;

@Service("noticeService")
@Transactional(propagation = Propagation.REQUIRED)
public class NoticeServiceImpl implements NoticeService { 
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public void noticeWrite(NoticeVO notice) throws DataAccessException{ 
		 noticeDAO.insertNotice(notice);
	}
	
	@Override
	public List listNotice() throws Exception {
		
		return noticeDAO.selectAllNoticeList();
	}
	
	@Override
	public NoticeVO viewNotice (int notice_no) throws DataAccessException {
		increaseHits(notice_no);
		NoticeVO noticeVO = noticeDAO.selectNotice(notice_no);
		return noticeVO;
	}
	
	@Override
	public int noticeRemove(int notice_no) throws DataAccessException {
		return noticeDAO.noticeDelete(notice_no);
	}
	
	@Override
	public NoticeVO noticeMod(int notice_no) throws DataAccessException {
		NoticeVO noticeVO = noticeDAO.noticeSelect(notice_no);
		return noticeVO;
	}
	
	@Override
	public int noticeModify(NoticeVO noticeVO) throws DataAccessException {
		return noticeDAO.noticeUpdate(noticeVO);
	}
	
	@Override
	public void increaseHits(int notice_no) throws DataAccessException {
		 noticeDAO.increaseHits(notice_no);
	}
}
	
	


