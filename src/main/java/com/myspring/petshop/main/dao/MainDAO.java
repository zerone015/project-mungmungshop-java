package com.myspring.petshop.main.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface MainDAO{
	public List<ProductVO> selectNewProducts() throws DataAccessException;
	public List<ProductVO> selectRankProducts() throws DataAccessException;
}