package com.myspring.petshop.board.notice.dao;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.board.notice.vo.NoticeVO;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertNotice(NoticeVO noticeVO) throws DataAccessException{
		sqlSession.insert("mapper.board.insertNotice", noticeVO);
	}
	
	@Override
	public List selectAllNoticeList() throws Exception {
		
		return sqlSession.selectList("mapper.board.selectAllNoticeList");
	}
	
	@Override
	public NoticeVO selectNotice(int notice_no) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.noticeView", notice_no);
		
	}
	
	@Override
	public int noticeDelete(int notice_no) throws DataAccessException {
		int  result=sqlSession.delete("mapper.board.noticeDelete", notice_no);
		return result;
	}
	
	@Override
	public NoticeVO noticeSelect(int notice_no) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.noticeSelect", notice_no);
	}
	
	@Override
	public int noticeUpdate(NoticeVO noticeVO) throws DataAccessException{
		int result=sqlSession.update("mapper.board.noticeUpdate", noticeVO);
		return result;
	}
	
	@Override
	public int increaseHits(int notice_no) throws DataAccessException {
		return sqlSession.update("mapper.board.noticeHits", notice_no);
	}

}
