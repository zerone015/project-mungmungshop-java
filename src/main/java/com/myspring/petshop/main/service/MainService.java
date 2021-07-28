package com.myspring.petshop.main.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface MainService{
	public List<ProductVO> getNewProducts() throws Exception;
	public List<ProductVO> getRankProducts() throws Exception;
}