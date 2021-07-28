package com.myspring.petshop.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.main.dao.MainDAO;
import com.myspring.petshop.main.dao.MainDAO;
import com.myspring.petshop.main.dao.MainDAO;
import com.myspring.petshop.product.vo.ProductVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MainServiceImpl implements MainService{
	@Autowired
	private MainDAO mainDAO;
	
	@Override
	public List<ProductVO> getNewProducts() throws Exception {
		return mainDAO.selectNewProducts();
	}
	
	@Override
	public List<ProductVO> getRankProducts() throws Exception {
		return mainDAO.selectRankProducts();
	}

}