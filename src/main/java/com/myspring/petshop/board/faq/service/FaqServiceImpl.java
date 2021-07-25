package com.myspring.petshop.board.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.petshop.board.event.vo.EventVO;
import com.myspring.petshop.board.faq.dao.FaqDAO;
import com.myspring.petshop.board.faq.vo.FaqVO;

@Service("faqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqDAO faqDAO;
	
	@Override
	public List listFaq() throws DataAccessException{
		List faqList = null;
		faqList = faqDAO.selectAllFaqList();
		return faqList;
	}

	@Override
	public int faqWrite(FaqVO faqVO) throws DataAccessException {
		return faqDAO.faqWrite(faqVO);
	}

	@Override
	public FaqVO faqView(int faq_no) throws DataAccessException {
		FaqVO faqVO = faqDAO.faqSelect(faq_no);
		return faqVO;
	}
	// 조회수 증가
	@Override
	public int increaseHits(int faq_no) {
		return faqDAO.increaseHist(faq_no);
	}
	
	@Override
	public int faqRemove(int faq_no) throws DataAccessException {
		return faqDAO.faqDelete(faq_no);
	}

	@Override
	public FaqVO faqMod(int faq_no) throws DataAccessException {
		FaqVO faqVO = faqDAO.faqSelect(faq_no);
		return faqVO;
	}

	@Override
	public int faqModify(FaqVO faqVO) throws DataAccessException {
		return faqDAO.faqUpdate(faqVO);
	}
}
