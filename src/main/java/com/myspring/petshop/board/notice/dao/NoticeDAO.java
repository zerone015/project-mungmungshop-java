package com.myspring.petshop.board.notice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.board.notice.vo.NoticeVO;

public interface NoticeDAO {
	
	public void insertNotice(NoticeVO noticeVO) throws DataAccessException;
	
	public List selectAllNoticeList() throws Exception;
	
	public NoticeVO selectNotice(int notice_no) throws DataAccessException;
	
	public int noticeDelete(int notice_no) throws DataAccessException;

	public NoticeVO noticeSelect(int notice_no) throws DataAccessException;
	
	public int noticeUpdate(NoticeVO noticeVO) throws DataAccessException;
	
	public int increaseHits(int notice_no) throws DataAccessException;
}
