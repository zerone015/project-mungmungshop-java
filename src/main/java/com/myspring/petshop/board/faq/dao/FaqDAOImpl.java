package com.myspring.petshop.board.faq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.board.event.vo.EventVO;
import com.myspring.petshop.board.faq.vo.FaqVO;

@Repository("faqDAO")
public class FaqDAOImpl implements FaqDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllFaqList() throws DataAccessException{
		List<FaqVO> faqList = null;
		faqList = sqlSession.selectList("mapper.board.selectAllFaqList");
		return faqList;
	}

	@Override
	public int faqWrite(FaqVO faqVO) throws DataAccessException {
		return sqlSession.insert("mapper.board.faqInsert", faqVO);
	}

	@Override
	public FaqVO faqSelect(int faq_no) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.faqSelect", faq_no);
	}

	@Override
	public int increaseHist(int faq_no) throws DataAccessException {
		return sqlSession.update("mapper.board.faqHits", faq_no);
	}

	@Override
	public int faqDelete(int faq_no) throws DataAccessException {
		int result=sqlSession.delete("mapper.board.faqDelete", faq_no);
		return result;
	}

	@Override
	public int faqUpdate(FaqVO faqVO) throws DataAccessException {
		int result = sqlSession.update("mapper.board.faqUpdate", faqVO);
		return result;
	}
}
