package com.myspring.petshop.board.qna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.Pagination;
import com.myspring.petshop.board.qna.vo.QnaVO;

@Repository("qnaDAO")
public class QnaDAOImpl implements QnaDAO{
	
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List selectAllQnaList(Pagination pagination) throws DataAccessException{
		List<QnaVO> qnaList = null;
		qnaList = sqlSession.selectList("mapper.board.selectAllQnaList", pagination);
		return qnaList;
	}
	
	@Override
	public int qnaCnt() throws DataAccessException{
		return sqlSession.selectOne("mapper.board.selectQnaCnt");
	}
	
	@Override
	public int qnaWrite(QnaVO qnaVO) throws DataAccessException {
		return sqlSession.insert("mapper.board.qnaInsert", qnaVO);
	}

	@Override
	public QnaVO qnaSelect(int qna_no) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.qnaSelect", qna_no);
	}

	@Override
	public int increaseHist(int qna_no) throws DataAccessException {
		return sqlSession.update("mapper.board.qnaHits", qna_no);
	}

	@Override
	public int qnaDelete(int qna_no) throws DataAccessException {
		int result=sqlSession.delete("mapper.board.qnaDelete", qna_no);
		return result;
	}

	@Override
	public int qnaUpdate(QnaVO qnaVO) throws DataAccessException {
		int result = sqlSession.update("mapper.board.qnaUpdate", qnaVO);
		return result;
	}

	@Override
	public Integer qnaMaxNo() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.qnaMaxNo");
	}

	@Override
	public int qnaReply(QnaVO qnaVO) throws DataAccessException {
		return sqlSession.insert("mapper.board.qnaReplyInsert", qnaVO);
	}
}
