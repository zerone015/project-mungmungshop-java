package com.myspring.petshop.board.qna.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.board.qna.vo.QnaVO;
import com.myspring.petshop.common.pagination.Pagination;

@Repository("qnaDAO")
public class QnaDAOImpl implements QnaDAO{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectQnaList(Map<String, Object> qnaMap) throws DataAccessException{
		List<QnaVO> qnaList = null;
		qnaList = sqlSession.selectList("mapper.board.selectQnaList", qnaMap);
		return qnaList;
	}
	
	@Override
	public List selectAllQnaList(Pagination pagination) throws DataAccessException{
		List<QnaVO> qnaList = null;
		qnaList = sqlSession.selectList("mapper.board.selectAllQnaList", pagination);
		return qnaList;
	}
	
	@Override
	public int qnaCnt(String member_nick) throws DataAccessException{
		return sqlSession.selectOne("mapper.board.selectQnaCnt", member_nick);
	}
	
	@Override
	public int qnaAllCnt() throws DataAccessException{
		return sqlSession.selectOne("mapper.board.selectQnaAllCnt");
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
	public void qnaDelete2(int qna_no) throws DataAccessException {
		sqlSession.update("mapper.board.qnaDelete2", qna_no);
	}

	@Override
	public int qnaUpdate(QnaVO qnaVO) throws DataAccessException {
		int result = sqlSession.update("mapper.board.qnaUpdate", qnaVO);
		return result;
	}

	@Override
	public int qnaMaxNo() throws DataAccessException {
		int qnaMaxNo;
		try{
			qnaMaxNo = sqlSession.selectOne("mapper.board.qnaMaxNo");
		}catch(NullPointerException e) {
			qnaMaxNo = 1;
		}
	
		return qnaMaxNo;
	}

	@Override
	public int qnaReply(QnaVO qnaVO) throws DataAccessException {
		return sqlSession.insert("mapper.board.qnaReplyInsert", qnaVO);
	}
	
	@Override
	public void addGroupOrd(QnaVO qnaVO) throws DataAccessException {
		sqlSession.update("mapper.board.addGroupOrd", qnaVO);
	}
}
