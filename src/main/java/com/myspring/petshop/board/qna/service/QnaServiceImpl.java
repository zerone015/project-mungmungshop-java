package com.myspring.petshop.board.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.petshop.board.qna.dao.QnaDAO;
import com.myspring.petshop.board.qna.vo.QnaVO;
import com.myspring.petshop.common.pagination.Pagination;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAO qnaDAO;
	
	@Override
	public List listQna(Pagination pagination) throws DataAccessException{
		List qnaList = null;
		qnaList = qnaDAO.selectAllQnaList(pagination);
		return qnaList;
	}
	
	@Override
	public int qnaCnt() throws DataAccessException {
		return qnaDAO.qnaCnt();
	}

	@Override
	public int qnaWrite(QnaVO qnaVO) throws DataAccessException {
		return qnaDAO.qnaWrite(qnaVO);
	}

	@Override
	public QnaVO qnaView(int qna_no) throws DataAccessException {
		QnaVO qnaVO = qnaDAO.qnaSelect(qna_no);
		return qnaVO;
	}
	// 조회수 증가
	@Override
	public int increaseHits(int qna_no) {
		return qnaDAO.increaseHist(qna_no);
	}
	
	@Override
	public int qnaRemove(int qna_no) throws DataAccessException {
		return qnaDAO.qnaDelete(qna_no);
	}

	@Override
	public QnaVO qnaMod(int qna_no) throws DataAccessException {
		QnaVO qnaVO = qnaDAO.qnaSelect(qna_no);
		return qnaVO;
	}

	@Override
	public int qnaModify(QnaVO qnaVO) throws DataAccessException {
		return qnaDAO.qnaUpdate(qnaVO);
	}
	
	
	// 게시글 번호(qna_no) Max값 + 1 = originNo
	@Override
	public Integer qnaMaxNo() throws DataAccessException{
		return qnaDAO.qnaMaxNo();	
	}

	@Override
	public int qnaReply(QnaVO qnaVO) throws DataAccessException {
		return qnaDAO.qnaReply(qnaVO);
	}

}
