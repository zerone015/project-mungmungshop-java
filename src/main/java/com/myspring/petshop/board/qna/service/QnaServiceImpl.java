package com.myspring.petshop.board.qna.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.board.qna.dao.QnaDAO;
import com.myspring.petshop.board.qna.vo.QnaVO;
import com.myspring.petshop.common.pagination.Pagination;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{

	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public List listQna(Map<String, Object> qnaMap) throws DataAccessException{
		List qnaList = null;
		qnaList = qnaDAO.selectQnaList(qnaMap);
		return qnaList;
	}
	
	@Override
	public List listAllQna(Pagination pagination) throws DataAccessException{
		List qnaList = null;
		qnaList = qnaDAO.selectAllQnaList(pagination);
		return qnaList;
	}
	
	@Override
	public int qnaCnt(String member_nick) throws DataAccessException {
		return qnaDAO.qnaCnt(member_nick);
	}
	
	@Override
	public int qnaAllCnt() throws DataAccessException {
		return qnaDAO.qnaAllCnt();
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
	public void qnaRemove2(int qna_no) throws DataAccessException {
		qnaDAO.qnaDelete2(qna_no);
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
	public int qnaMaxNo() throws DataAccessException{
		return qnaDAO.qnaMaxNo();	
	}

	@Override
	public int qnaReply(QnaVO qnaVO) throws DataAccessException {
		int qna_groupOrd = qnaVO.getQna_groupOrd();
		if(qna_groupOrd > 1) {
			qnaDAO.addGroupOrd(qnaVO);
		}
		return qnaDAO.qnaReply(qnaVO);
	}

}
