package com.myspring.petshop.board.qna.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.board.qna.vo.QnaVO;
import com.myspring.petshop.common.pagination.Pagination;

public interface QnaDAO {

	public List selectQnaList(Map<String, Object> qnaMap) throws DataAccessException;
	
	public List selectAllQnaList(Pagination pagination) throws DataAccessException;

	public int qnaWrite(QnaVO qnaVO) throws DataAccessException;

	public QnaVO qnaSelect(int qna_no) throws DataAccessException;

	public int qnaDelete(int qna_no) throws DataAccessException;
	public void qnaDelete2(int qna_no) throws DataAccessException;

	public int increaseHist(int qna_no) throws DataAccessException;

	public int qnaUpdate(QnaVO qnaVO) throws DataAccessException;

	public int qnaCnt(String member_nick) throws DataAccessException;
	
	public int qnaAllCnt() throws DataAccessException;

	public int qnaMaxNo() throws DataAccessException;

	public int qnaReply(QnaVO qnaVO) throws DataAccessException;

	public void addGroupOrd(QnaVO qnaVO) throws DataAccessException;
}
