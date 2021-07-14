package com.myspring.petshop.board.faq.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.board.event.vo.EventVO;
import com.myspring.petshop.board.faq.vo.FaqVO;

public interface FaqService {

	public List listFaq() throws DataAccessException;

	public int faqWrite(FaqVO faqVO) throws DataAccessException;

	public FaqVO faqView(int faq_no) throws DataAccessException;

	public int increaseHits(int faq_no);

	public int faqRemove(int faq_no) throws DataAccessException;

	public FaqVO faqMod(int faq_no) throws DataAccessException;

	public int faqModify(FaqVO faqVO) throws DataAccessException;

}
