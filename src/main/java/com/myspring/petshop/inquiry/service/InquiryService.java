package com.myspring.petshop.inquiry.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface InquiryService {

	public List listInquiry(String p_code) throws DataAccessException;

}
