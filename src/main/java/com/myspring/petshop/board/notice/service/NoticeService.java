package com.myspring.petshop.board.notice.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.board.notice.vo.NoticeVO;

public interface NoticeService {
	public void noticeWrite(NoticeVO noticeVO) throws DataAccessException;
	
	public List listNotice() throws Exception;
	
	public NoticeVO viewNotice(int notice_no) throws DataAccessException;
	
	public int noticeRemove(int notice_no) throws DataAccessException;

	public NoticeVO noticeMod(int notice_no) throws  DataAccessException;
	
	public int noticeModify(NoticeVO noticeVO) throws DataAccessException;
	
	public void increaseHits(int notice_no) throws DataAccessException;
}
