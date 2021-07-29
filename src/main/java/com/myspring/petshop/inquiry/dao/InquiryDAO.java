package com.myspring.petshop.inquiry.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface InquiryDAO {

	public List selectAllInquiryList(String p_code) throws DataAccessException;

}
