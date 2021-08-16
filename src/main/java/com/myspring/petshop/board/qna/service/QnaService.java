package com.myspring.petshop.board.qna.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.board.qna.vo.QnaVO;
import com.myspring.petshop.common.pagination.Pagination;

public interface QnaService {

	public List listQna(Map<String, Object> qnaMap) throws DataAccessException;
	
	public List listAllQna(Pagination pagination) throws DataAccessException;

	public int qnaWrite(QnaVO qnaVO) throws DataAccessException;

	public QnaVO qnaView(int qna_no) throws DataAccessException;

	public int increaseHits(int qna_no);

	public int qnaRemove(int qna_no) throws DataAccessException;
	
	public void qnaRemove2(int qna_no) throws DataAccessException;

	public QnaVO qnaMod(int qna_no) throws DataAccessException;

	public int qnaModify(QnaVO qnaVO) throws DataAccessException;

	public int qnaCnt(String member_nick) throws DataAccessException;
	
	public int qnaAllCnt() throws DataAccessException;

	public int qnaMaxNo() throws DataAccessException;

	public int qnaReply(QnaVO qnaVO)throws DataAccessException;


}
