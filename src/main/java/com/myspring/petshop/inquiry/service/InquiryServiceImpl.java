package com.myspring.petshop.inquiry.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.petshop.inquiry.dao.InquiryDAO;

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService{
	
	@Autowired
	private InquiryDAO inquiryDAO;
	
	@Override
	public List listInquiry(String p_code) throws DataAccessException{
		List inquiryList = null;
		inquiryList = inquiryDAO.selectAllInquiryList(p_code);
		return inquiryList;
	}

}
