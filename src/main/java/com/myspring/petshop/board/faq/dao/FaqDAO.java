package com.myspring.petshop.board.faq.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.board.faq.vo.FaqVO;

public interface FaqDAO {
	
	public List selectAllFaqList() throws DataAccessException;

	public int faqWrite(FaqVO faqVO) throws DataAccessException;

	public FaqVO faqSelect(int faq_no) throws DataAccessException;

	public int increaseHist(int faq_no) throws DataAccessException;

	public int faqDelete(int faq_no) throws DataAccessException;

	public int faqUpdate(FaqVO faqVO) throws DataAccessException;
	
}
