package com.myspring.petshop.board.qna.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.board.qna.vo.QnaVO;
import com.myspring.petshop.common.pagination.Pagination;

public interface QnaService {

	public List listQna(Pagination pagination) throws DataAccessException;

	public int qnaWrite(QnaVO qnaVO) throws DataAccessException;

	public QnaVO qnaView(int qna_no) throws DataAccessException;

	public int increaseHits(int qna_no);

	public int qnaRemove(int qna_no) throws DataAccessException;

	public QnaVO qnaMod(int qna_no) throws DataAccessException;

	public int qnaModify(QnaVO qnaVO) throws DataAccessException;

	public int qnaCnt() throws DataAccessException;

	public Integer qnaMaxNo() throws DataAccessException;

	public int qnaReply(QnaVO qnaVO)throws DataAccessException;


}
